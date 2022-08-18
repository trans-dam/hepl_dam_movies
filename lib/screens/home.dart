import 'package:movies/partials/navbar/nav_bar.dart';
import 'package:movies/partials/sidebar/sidebar.dart';
import 'package:movies/partials/sliders/media_slider.dart';
import 'package:movies/styles/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
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
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors
              .transparent,
        ),
        child: const Drawer(
          child: SidebarScreen(),
        ),
      ),
      body: SafeArea(
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
      ),
    );
  }
}
