import 'package:Movies/partials/navbar/search_field.dart';
import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

import '../../screens/profile.dart';
import '../avatar.dart';
import 'burger_menu.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultSpacer),
      child: Row(
        children: [
          const BurgerMenu(),
          const SizedBox(
            width: kDefaultSpacer,
          ),
          const SearchField(),
          const SizedBox(
            width: kDefaultSpacer,
          ),
          const Icon(
            Icons.notifications,
            color: kMainTextColor,
          ),
          const SizedBox(
            width: kDefaultSpacer,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Avatar(),
          ),
        ],
      ),
    );
  }
}
