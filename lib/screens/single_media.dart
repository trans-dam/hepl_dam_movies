import 'package:Movies/models/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleMedia extends StatefulWidget {
  final Media _movie;

  SingleMedia(this._movie, {Key? key}) : super(key: key);

  @override
  _SingleMediaState createState() => _SingleMediaState();
}

class _SingleMediaState extends State<SingleMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(widget._movie.title)),
    );
  }
}
