import 'package:Movies/screens/login_screen.dart';
import 'package:Movies/styles/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movies',
            theme: ThemeData(
              cupertinoOverrideTheme: const CupertinoThemeData(
                primaryColor: kMainTextColor,
              ),
              textSelectionTheme:
                  const TextSelectionThemeData(cursorColor: kMainTextColor),
              primaryColor: kMainTextColor,
            ),
            home: Scaffold(
              backgroundColor: kMainBackgroundColor,
              body: LoginScreen(),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(),
            ),
          );
        }
      },
    );
  }
}
