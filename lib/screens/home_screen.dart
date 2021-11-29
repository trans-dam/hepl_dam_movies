import 'package:flutter/material.dart';
import 'package:movies_2021_2022/partials/avatar.dart';
import 'package:movies_2021_2022/partials/navbar/burger_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BurgerMenu(),
                Icon(Icons.notifications),
                Avatar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
