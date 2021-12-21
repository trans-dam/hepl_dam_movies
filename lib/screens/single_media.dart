import 'package:Movies/models/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleMedia extends StatefulWidget {
  final Media _media;

  SingleMedia(this._media, {Key? key}) : super(key: key);

  @override
  _SingleMediaState createState() => _SingleMediaState();
}

class _SingleMediaState extends State<SingleMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text(widget._media.title),
          Text(widget._media.voteAverage.toString()),
          Text(widget._media.posterPath),
        ],
      )),
    );
  }
}
