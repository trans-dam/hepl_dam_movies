import 'package:Movies/screens/home.dart';
import 'package:Movies/screens/login_form.dart';
import 'package:Movies/styles/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
          FirebaseAuth.instance.currentUser;
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
            home: FirebaseAuth.instance.currentUser == null
                ? LoginForm()
                : Home(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(
                child: Text(snapshot.error.toString()),
              ),
            ),
          );
        }
      },
    );
  }
}
