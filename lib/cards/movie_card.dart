import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_2021_2022/cards/movie_rate.dart';
import 'package:movies_2021_2022/models/movie.dart';
import 'package:movies_2021_2022/styles/constants.dart';

import 'movie_picture.dart';

class MovieCard extends StatelessWidget {
  final Movie _movie;
  final bool _isLast;

  const MovieCard(this._movie, this._isLast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: kDefaultSpacer, right: _isLast ? kDefaultSpacer : 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: MoviePicture(_movie.posterPath),
            ),
            Row(
              children: [
                const SizedBox(
                  width: kDefaultSpacer,
                ),
                MovieRate(voteAverage: _movie.voteAverage),
              ],
            )
          ],
        ),
        const SizedBox(
          height: kVerticalSpacer / 2,
        ),
        Container(
          width: 154,
          child: Text(
            _movie.title,
            softWrap: true,
            maxLines: 2,
            style: kCardTitleStyle.apply(color: kMainTextColor),
          ),
        ),
        SizedBox(height: 6),
        Text(
          DateFormat.yMMMMd().format(_movie.releaseDate),
          style: kCardSubtitleStyle.apply(color: kMainTextColor),
          textAlign: TextAlign.left,
        )
      ]),
    );
  }
}
