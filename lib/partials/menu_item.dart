import 'package:flutter/material.dart';
import 'package:movies_2021_2022/styles/constants.dart';
import 'package:movies_2021_2022/models/data_item.dart';

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
                gradient: _menuItemData.gradient,
              ),
              child: IconButton(
                icon: _menuItemData.icon,
                color: Colors.white,
                onPressed: () {
                  print(_menuItemData.name);
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              _menuItemData.name,
              style: fontStyleMenuItem,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
