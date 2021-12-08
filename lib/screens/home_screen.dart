import 'package:flutter/material.dart';
import 'package:movies_2021_2022/partials/navbar/nav_bar.dart';
import 'package:movies_2021_2022/partials/sliders/media_slider.dart';
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
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NavBar(),
            MediaSlider("Films populaires", "Cette semaine", "movie"),
            MediaSlider("Séries populaires", "Cette semaine", "tv"),
            SizedBox(
              height: kVerticalSpacer * 3,
            )
          ],
        ),
      ),
    );
  }
}
