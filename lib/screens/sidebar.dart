import 'package:flutter/material.dart';
import 'package:movies_2021_2022/Partials/menu_item.dart';
import 'package:movies_2021_2022/models/menu_items.dart';

import '../constants.dart';
import 'home_screen.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(34)),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 34),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: MenuItem(MenuItemsData[0]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              MenuItem(MenuItemsData[1]),
              MenuItem(MenuItemsData[2]),
              Spacer(),
              Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                  ),
                  Text(
                    "Je me déconnecte",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
