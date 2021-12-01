import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: defaultWidth,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: boxShadowItem,
            borderRadius: borderRadiusItem),
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 11),
              icon: Icon(
                Icons.search,
                color: mainTextColor,
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: mainTextColor, fontSize: 17),
              hintText: 'Rechercher…',
            ),
          ),
        ),
      ),
    );
  }
}
