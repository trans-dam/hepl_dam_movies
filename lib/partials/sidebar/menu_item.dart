import 'package:movies/models/data_item.dart';
import 'package:movies/styles/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyMenuItem extends StatelessWidget {
  final MenuItemData _menuItemData;

  const MyMenuItem(this._menuItemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: kDefaultWidth,
              height: kDefaultWidth,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: kBorderRadiusItem,
                gradient: _menuItemData.gradient,
              ),
              child: IconButton(
                icon: _menuItemData.icon,
                iconSize: 18,
                color: Colors.white,
                onPressed: () {
                  if (kDebugMode) {
                    print(_menuItemData.name);
                  }
                },
              ),
            ),
            const SizedBox(
              width: kHorizontalSpacer * 0.8,
            ),
            Text(
              _menuItemData.name,
              style: kFontStyleMenuItem,
            ),
          ],
        ),
        const SizedBox(
          height: kVerticalSpacer,
        )
      ],
    );
  }
}
