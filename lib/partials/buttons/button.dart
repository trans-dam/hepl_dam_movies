import 'package:movies/styles/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const Button(this.label, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalSpacer, vertical: kVerticalSpacer / 2),
      margin: const EdgeInsets.only(top: kVerticalSpacer),
      decoration: BoxDecoration(
          borderRadius: kBorderRadiusItem,
          boxShadow: kBoxShadowItem,
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: kTitleSection.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
