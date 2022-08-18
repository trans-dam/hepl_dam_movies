import 'dart:convert';
import 'package:Movies/models/media.dart';
import 'package:Movies/styles/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../cards/media_card.dart';

class MediaSlider extends StatefulWidget {
  final String _title;
  final String _subTitle;
  final String _type;

  const MediaSlider(this._title, this._subTitle, this._type, {Key? key})
      : super(key: key);

  @override
  _MediaSliderState createState() => _MediaSliderState();
}

class _MediaSliderState extends State<MediaSlider> {
  final List<Media> _medias = [];

  int _currentMovie = 0;

  @override
  void initState() {
    super.initState();
    getMoviesFromApi();
  }

  void getMoviesFromApi() {
    http
        .get(Uri.parse(
            "https://api.themoviedb.org/3/discover/${widget._type}?sort_by=popularity.desc&api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr"))
        .then((response) {
      if (response.statusCode == 200) {
        dynamic datas = jsonDecode(response.body);
        for (var data in datas['results']) {
          // If the media cannot be parsed, then it is bound to be a problem. It is only added if all fields are filled in
          try {
            Media movie = Media.fromJson(data);
            setState(() {
              _medias.add(movie);
            });
          } catch (error) {
            if (kDebugMode) {
              print("Unable to add media $_medias");
              print(error);
            }
          }
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
      children: _medias.map((course) {
        var index = _medias.indexOf(course);
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultSpacer,
              right: kDefaultSpacer,
              top: kVerticalSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._title,
                style: kLargeTitleStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget._subTitle,
                style: kSubtitleStyle,
              ),
              const SizedBox(
                height: kVerticalSpacer,
              )
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _medias.length,
              controller: PageController(initialPage: 1, viewportFraction: 0.4),
              padEnds: false,
              onPageChanged: (index) {
                setState(() {
                  _currentMovie = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Opacity(
                    opacity: _currentMovie == index ? 1 : 0.7,
                    child:
                        MediaCard(_medias[index], index == _medias.length - 1));
              }),
        ),
        updateIndicators(),
      ],
    );
  }
}
