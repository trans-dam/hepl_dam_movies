import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_2021_2022/screens/home_screen.dart';
import 'package:movies_2021_2022/styles/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: mainTextColor,
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: mainTextColor),
      ),
      home: Scaffold(
        backgroundColor: mainBackgroundColor,
        body: HomeScreen(),
      ),
    );
  }
}
