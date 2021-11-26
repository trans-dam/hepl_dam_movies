import 'package:flutter/material.dart';
import 'package:movies_2021_2022/constants.dart';
import 'package:movies_2021_2022/screens/sidebar.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: mainBackgroundColor,
        body: SidebarScreen(),
      ),
    );
  }
}
