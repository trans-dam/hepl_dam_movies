import 'package:flutter/material.dart';
import 'package:movies_2021_2022/models/menu_items.dart';

import '../constants.dart';

class MenuItem extends StatelessWidget {
  final MenuItemData _menuItemData;

  const MenuItem(this._menuItemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                gradient: _menuItemData.itemGradient,
              ),
              child: IconButton(
                icon: _menuItemData.itemIcon,
                color: Colors.white,
                onPressed: () {
                  print(_menuItemData.itemName);
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              _menuItemData.itemName,
              style: fontStyleMenuItem,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
