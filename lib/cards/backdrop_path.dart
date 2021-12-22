import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

class BackdropPath extends StatelessWidget {
  final String backdropPath;

  const BackdropPath(this.backdropPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3 + kVerticalSpacer * 2,
      padding: const EdgeInsets.only(bottom: kVerticalSpacer * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$backdropPath',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
