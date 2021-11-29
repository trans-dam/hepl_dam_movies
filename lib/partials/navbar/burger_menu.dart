import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';

class BurgerMenu extends StatefulWidget {
  const BurgerMenu({Key? key}) : super(key: key);

  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadiusItem,
        boxShadow: boxShadowItem,
      ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 7, vertical: 14),
        child: Image(
          width: 30,
          height: 14,
          image: AssetImage('assets/icons/icon-sidebar.png'),
        ),

      ),
    );
  }
}
