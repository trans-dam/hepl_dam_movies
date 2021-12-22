import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

class SingleMovieCard extends StatelessWidget {
  final String path;

  const SingleMovieCard(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: kHorizontalSpacer,
      bottom: 0,
      child: Hero(
        tag: path,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: kBoxShadowItem, borderRadius: kBorderRadiusItem),
          child: ClipRRect(
            borderRadius: kBorderRadiusItem,
            child: Image.network(
              'https://image.tmdb.org/t/p/w154/$path',
              height: 230,
              width: 154,
            ),
          ),
        ),
      ),
    );
  }
}
