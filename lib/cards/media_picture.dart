import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';

class MediaPicture extends StatelessWidget {
  final String _moviePath;

  const MediaPicture(this._moviePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: kBorderRadiusItem,
          boxShadow: kBoxShadowItem,
          color: Colors.white),
      child: Image.network(
        "https://image.tmdb.org/t/p/w154/$_moviePath",
        height: 231,
        width: 154,
      ),
    );
  }
}
