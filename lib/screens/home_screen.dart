import 'package:flutter/material.dart';
import 'package:movies_2021_2022/partials/avatar.dart';
import 'package:movies_2021_2022/partials/navbar/burger_menu.dart';
import 'package:movies_2021_2022/partials/navbar/search_field.dart';
import 'package:movies_2021_2022/styles/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                BurgerMenu(),
                SizedBox(
                  width: defaultNavbarSpacer,
                ),
                SearchField(),
                SizedBox(
                  width: defaultNavbarSpacer,
                ),
                Icon(
                  Icons.notifications,
                  color: mainTextColor,
                ),
                SizedBox(
                  width: defaultNavbarSpacer,
                ),
                Avatar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
