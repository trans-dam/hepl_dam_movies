import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MediaRate extends StatelessWidget {
  const MediaRate({Key? key, required this.voteAverage}) : super(key: key);
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
            // Bug: "animation: true" and "percent== 1" causes an infinite animation
            percent: voteAverage == 10.0 ? 0.99 : voteAverage / 10,
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
