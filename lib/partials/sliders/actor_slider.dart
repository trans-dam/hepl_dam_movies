import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../cards/actor_card.dart';
import '../../models/actor.dart';
import '../../styles/constants.dart';

class ActorList extends StatefulWidget {
  const ActorList({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  _ActorListState createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  List<Container> indicators = [];
  int currentPage = 0;
  final List<Actor> actors = [];

  @override
  void initState() {
    super.initState();
    getActorsFromApi();
  }

  void getActorsFromApi() {
    http
        .get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${this.widget.movieId}/casts?api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr'))
        .then((response) {
      if (response.statusCode == 200) {
        dynamic datas = jsonDecode(response.body);
        for (var data in datas['cast']) {
          setState(() {
            actors.add(Actor.fromJson(data));
          });
        }
      } else {
        throw Exception(
            'Oups ! ${response.statusCode} : ${response.reasonPhrase}');
      }
    }).onError((error, stackTrace) {
      throw Exception(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ActorCard(
                spacer: index == 0 ? kHorizontalSpacer : 0,
                actor: actors[index],
              );
            },
            itemCount: actors.length,
          ),
        ),
        SizedBox(
          height: kVerticalSpacer * 3,
        )
      ],
    );
  }
}
