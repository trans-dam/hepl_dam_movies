import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: boxShadowItem,
      ),
      child: Image(
        image: AssetImage('assets/img/profile.jpg'),
        width: defaultWidth,
        height: defaultWidth,
      ),
    );
  }
}
