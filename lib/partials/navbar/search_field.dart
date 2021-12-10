import 'package:Movies/styles/constants.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem),
        child: TextField(
          onChanged: (text) {
            print(text);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            isDense: true,
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: kMainTextColor,
            ),
            hintText: 'Rechercher...',
            hintStyle: TextStyle(
              fontSize: 17,
              color: kMainTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
