import 'dart:convert';
import 'package:movies/cards/backdrop_path.dart';
import 'package:movies/cards/single_media_picture.dart';
import 'package:movies/models/media.dart';
import 'package:movies/models/media_detail.dart';
import 'package:movies/partials/buttons/close_button.dart';
import 'package:movies/partials/stars.dart';
import 'package:movies/styles/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../partials/sliders/actor_slider.dart';

class SingleMedia extends StatefulWidget {
  final Media _media;
  final MediaDetail mediaDetail = MediaDetail();

  SingleMedia(this._media, {Key? key}) : super(key: key);

  @override
  _SingleMediaState createState() => _SingleMediaState();
}

class _SingleMediaState extends State<SingleMedia> {
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    reassemble();
  }

  @override
  void reassemble() {
    super.reassemble();
    getMediaDetailFromApi();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  void getMediaDetailFromApi() {
    http
        .get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${widget._media.movieId}?api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr'))
        .then((response) {
      if (kDebugMode) {
        print(
          'https://api.themoviedb.org/3/movie/${widget._media.movieId}?api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr');
      }
      if (response.statusCode == 200) {
        setState(() {
          widget.mediaDetail.fromJson(jsonDecode(response.body));
        });
      } else {
        throw Exception(
            'Oups ! ${response.statusCode} : ${response.reasonPhrase} \n widget._media.movieId ! ${widget._media.movieId}');
      }
    }).onError((error, stackTrace) {
      throw Exception(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BackdropPath(widget._media.backdropPath),
                const MyCloseButton(),
                Positioned(
                  left: kHorizontalSpacer,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SingleMediaPicture(widget._media.posterPath),
                      Stars((widget._media.voteAverage / 2).floor())
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kVerticalSpacer,
                  left: kHorizontalSpacer,
                  right: kHorizontalSpacer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget._media.title,
                    child: Text(
                      widget._media.title,
                      style: kLargeTitleStyle,
                    ),
                  ),
                  const SizedBox(
                    height: kVerticalSpacer / 3,
                  ),
                  Text(
                    widget.mediaDetail.tagline,
                    style: kTagLineStyle,
                  ),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.mediaDetail.genres.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Text(
                          " - ",
                          style: kGenreStyle,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var g = widget.mediaDetail.genres;
                        return Text(
                          "${g[index]['name']}",
                          style: kGenreStyle,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: kVerticalSpacer,
                  ),
                  const Text(
                    "Description",
                    style: kTitleSection,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer / 2,
                  ),
                  Text(
                    widget._media.overview,
                    style: kBodyLabelStyle,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer,
                  ),
                  const Text(
                    "Date de sortie",
                    style: kTitleSection,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer / 2,
                  ),
                  Text(
                    dateFormat.format(widget._media.releaseDate),
                    style: kBodyLabelStyle,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer,
                  ),
                  const Text(
                    "Durée",
                    style: kTitleSection,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer / 2,
                  ),
                  Text(
                    '${(widget.mediaDetail.runtime / 60).truncate().toString().padLeft(2, '0')} : ${(widget.mediaDetail.runtime % 60).truncate().toString().padLeft(2, '0')}',
                    style: kBodyLabelStyle,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: kVerticalSpacer,
                  ),
                  ActorList(movieId: widget._media.movieId),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
