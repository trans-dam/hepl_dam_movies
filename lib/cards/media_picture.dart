import 'package:Movies/styles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaPicture extends StatelessWidget {
  final String _mediaPath;

  const MediaPicture(this._mediaPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: kBorderRadiusItem,
          boxShadow: kBoxShadowItem,
          color: Colors.white),
      child: Image.network(
        "https://image.tmdb.org/t/p/w154/$_mediaPath",
        height: 231,
        width: 154,
      ),
    );
  }
}
