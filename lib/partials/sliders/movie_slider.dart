import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_2021_2022/models/movie.dart';
import 'package:movies_2021_2022/styles/constants.dart';

import '../../cards/movie_card.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final List<Movie> _movies = [];

  int _currentMovie = 0;

  @override
  void initState() {
    super.initState();
    getMoviesFromApi();
  }

  void getMoviesFromApi() {
    http
        .get(Uri.parse(
            "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr"))
        .then((response) {
      if (response.statusCode == 200) {
        dynamic datas = jsonDecode(response.body);
        for (var data in datas['results']) {
          setState(() {
            _movies.add(Movie.fromJson(data));
          });
        }
      } else {
        throw Exception(
            "Oups ! ${response.statusCode} - ${response.reasonPhrase}");
      }
    }).onError((error, stackTrace) {
      throw Exception("Oups ! ${error.toString()}");
    });
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _movies.map((course) {
        var index = _movies.indexOf(course);
        return Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.only(
              right:
                  _currentMovie - 1 == index || _currentMovie == index ? 0 : 7),
          decoration: BoxDecoration(
              color: (_currentMovie - 1 == index ||
                      _currentMovie == index ||
                      _currentMovie + 1 == index)
                  ? kMainTextColor
                  : kMainTextColor.withOpacity(0.22)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _movies.length,
              controller: PageController(initialPage: 1, viewportFraction: 0.4),
              padEnds: false,
              onPageChanged: (index) {
                setState(() {
                  _currentMovie = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Opacity(
                      opacity: _currentMovie == index ? 1 : 0.7,
                      child: MovieCard(
                          _movies[index], index == _movies.length - 1)),
                );
              }),
        ),
        updateIndicators(),
      ],
    );
  }
}
