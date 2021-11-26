import 'package:flutter/material.dart';
import 'package:movies_2021_2022/Partials/menu_item.dart';
import 'package:movies_2021_2022/models/data_item.dart';

import '../styles/constants.dart';
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
              Row(children: [

              ],)
              MenuItem(menuItemsData[0]),
              MenuItem(menuItemsData[1]),
              MenuItem(menuItemsData[2]),
              Spacer(),
              Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Je me déconnecte!",
                    style: fontStyleLegend,
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
