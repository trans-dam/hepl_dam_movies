import 'package:movies/styles/constants.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final int withBorder;

  const Stars(this.withBorder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(
              left: kHorizontalSpacer / 2, bottom: kVerticalSpacer / 2),
          child: Icon(
            index < withBorder ? Icons.star : Icons.star_border,
            color: kSecondColor,
          ),
        );
      }),
    );
  }
}
