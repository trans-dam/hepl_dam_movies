import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:movies_2021_2022/cards/movie_rate.dart';
import 'package:movies_2021_2022/models/movie.dart';
import 'package:movies_2021_2022/styles/constants.dart';

import 'movie_picture.dart';

class MovieCard extends StatefulWidget {
  final Movie _movie;
  final bool _isLast;

  const MovieCard(this._movie, this._isLast, {Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late DateFormat dateFormat;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: kDefaultSpacer, right: widget._isLast ? kDefaultSpacer : 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: MoviePicture(widget._movie.posterPath),
            ),
            Row(
              children: [
                const SizedBox(
                  width: kDefaultSpacer,
                ),
                MovieRate(voteAverage: widget._movie.voteAverage),
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
            widget._movie.title,
            softWrap: true,
            maxLines: 2,
            style: kCardTitleStyle.apply(color: kMainTextColor),
          ),
        ),
        SizedBox(height: 6),
        Text(
          dateFormat.format(widget._movie.releaseDate),
          style: kCardSubtitleStyle.apply(color: kMainTextColor),
          textAlign: TextAlign.left,
        )
      ]),
    );
  }
}
