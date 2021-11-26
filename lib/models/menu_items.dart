import 'package:flutter/material.dart';

import '../constants.dart';

class MenuItemData {
  final String _itemName;
  final LinearGradient _itemGradient;
  final Icon _itemIcon;

  MenuItemData(this._itemName, this._itemGradient, this._itemIcon);

  Icon get itemIcon => _itemIcon;

  LinearGradient get itemGradient => _itemGradient;

  String get itemName => _itemName;
}

var MenuItemsData = [
  MenuItemData(
    "Accueil",
    homeGradientButton,
    const Icon(Icons.home),
  ),
  MenuItemData(
    "Payement",
    paymentGradientButton,
    const Icon(
      Icons.credit_card,
    ),
  ),
  MenuItemData(
    "Réglages",
    settingsGradientButton,
    const Icon(
      Icons.settings,
    ),
  )
];
