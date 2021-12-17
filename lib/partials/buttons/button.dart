import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _label;
  const Button(this._label, {Key? key}) : super(key: key);

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
          Text(
            _label,
            style: kTitleSection.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
