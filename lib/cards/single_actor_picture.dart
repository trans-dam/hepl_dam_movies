import 'package:flutter/material.dart';

class SingleActorPicture extends StatelessWidget {
  const SingleActorPicture({Key? key, required this.profilePath})
      : super(key: key);
  final String profilePath;

  @override
  Widget build(BuildContext context) {
    if (profilePath != "") {
      return FadeInImage.assetNetwork(
        image: 'https://image.tmdb.org/t/p/w154/$profilePath',
        placeholder: 'assets/img/actor_placeholder.jpg',
        height: 190,
        width: 154,
        fit: BoxFit.fitWidth,
      );
    }
    return Image.asset(
      'assets/img/actor_placeholder.jpg',
      height: 190,
      width: 154,
      fit: BoxFit.fitWidth,
    );
  }
}
