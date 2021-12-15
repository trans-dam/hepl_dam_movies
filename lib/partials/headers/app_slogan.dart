import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

class AppSlogan extends StatelessWidget {
  const AppSlogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "L’application pour découvrir des nouveaux films",
      style: kTagLineStyle.apply(color: kMainTextColor),
    );
  }
}
