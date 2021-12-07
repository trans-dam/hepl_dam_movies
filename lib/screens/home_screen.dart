import 'package:flutter/material.dart';
import 'package:movies_2021_2022/partials/navbar/nav_bar.dart';
import 'package:movies_2021_2022/partials/sliders/movie_slider.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavBar(),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultSpacer, top: kVerticalSpacer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Films populaires",
                  style: kLargeTitleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Cette semaine",
                  style: kSubtitleStyle,
                ),
                SizedBox(
                  height: kVerticalSpacer,
                )
              ],
            ),
          ),
          MovieSlider(),
        ],
      ),
    );
  }
}
