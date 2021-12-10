import 'package:Movies/cards/media_rate.dart';
import 'package:Movies/models/media.dart';
import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'media_picture.dart';

class MediaCard extends StatefulWidget {
  final Media _movie;
  final bool _isLast;

  const MediaCard(this._movie, this._isLast, {Key? key}) : super(key: key);

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
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
              child: MediaPicture(widget._movie.posterPath),
            ),
            Row(
              children: [
                const SizedBox(
                  width: kDefaultSpacer,
                ),
                MediaRate(voteAverage: widget._movie.voteAverage),
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
