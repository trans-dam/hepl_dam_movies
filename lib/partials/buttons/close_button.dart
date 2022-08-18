import 'package:movies/styles/constants.dart';
import 'package:flutter/material.dart';

class MyCloseButton extends StatelessWidget {
  const MyCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: kHorizontalSpacer,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: kBorderRadiusItem,
              color: kMainBackgroundColor,
              boxShadow: kBoxShadowItem,
            ),
            width: kDefaultWidth,
            height: kDefaultWidth,
            child: const Icon(
              Icons.close,
              color: kMainTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
