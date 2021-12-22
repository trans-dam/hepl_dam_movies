import 'package:Movies/cards/backdrop_path.dart';
import 'package:Movies/cards/single_movie_card.dart';
import 'package:Movies/models/media.dart';
import 'package:Movies/partials/buttons/close_button.dart';
import 'package:flutter/material.dart';

class SingleMedia extends StatefulWidget {
  final Media _media;

  const SingleMedia(this._media, {Key? key}) : super(key: key);

  @override
  _SingleMediaState createState() => _SingleMediaState();
}

class _SingleMediaState extends State<SingleMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropPath(widget._media.backdropPath),
          const MyCloseButton(),
          SingleMovieCard(widget._media.posterPath),

        ],
      ),
    );
  }
}
