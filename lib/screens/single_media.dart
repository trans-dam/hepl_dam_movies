import 'dart:convert';
import 'dart:ffi';
import 'package:Movies/cards/backdrop_path.dart';
import 'package:Movies/cards/single_media_card.dart';
import 'package:Movies/models/media.dart';
import 'package:Movies/models/media_detail.dart';
import 'package:Movies/partials/buttons/close_button.dart';
import 'package:Movies/partials/stars.dart';
import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
    getMediaDetailFromApi();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  @override
  void reassemble() {
    getMediaDetailFromApi();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  void getMediaDetailFromApi() {
    http
        .get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${widget._media.movieId}?api_key=fc0b570a0ec2e5a82a99bf4d8340e012&language=fr-fr'))
        .then((response) {
      if (response.statusCode == 200) {
        setState(() {
          this.widget.mediaDetail.fromJson(jsonDecode(response.body));
        });
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
    return Scaffold(
      body: Column(
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
                    SingleMediaCard(widget._media.posterPath),
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
                Text(
                  widget._media.title,
                  style: kLargeTitleStyle,
                ),
                const SizedBox(
                  height: kVerticalSpacer / 3,
                ),
                Text(
                  widget.mediaDetail.tagline,
                  style: kTagLineStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: widget.mediaDetail.genres.map((genre) {
                    return Text(
                      '${genre['name']} ${widget.mediaDetail.genres.indexOf(genre) == widget.mediaDetail.genres.length - 1 ? '' : ' - '} ',
                      style: kGenreStyle,
                    );
                  }).toList(),
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
                  '${(widget.mediaDetail.runtime/60).truncate().toString().padLeft(2,'0')} : ${(widget.mediaDetail.runtime %60).truncate().toString().padLeft(2,'0')}',
                  style: kBodyLabelStyle,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
