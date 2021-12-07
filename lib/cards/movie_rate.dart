import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieRate extends StatelessWidget {
  const MovieRate({Key? key, required this.voteAverage}) : super(key: key);
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            animation: true,
            lineWidth: 5,
            restartAnimation: true,
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
            percent: voteAverage / 10,
            center: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${(voteAverage * 10).truncate()}",
                  style: kVoteStyle,
                ),
                Text(
                  '%',
                  style: kVoteStyle.copyWith(fontSize: 11),
                )
              ],
            ),
            progressColor: kSecondColor,
            fillColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
