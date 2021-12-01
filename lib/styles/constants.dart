import 'package:flutter/material.dart';

const mainBackgroundColor = const Color(0xFFeaeaea);
const mainTextColor = const Color(0xFF254D60);
const double horizontalSpace = 16;
const double verticalSpace = 26;
const double defaultWidth = 36;
const double defaultNavbarSpacer = 17;
const BorderRadius borderRadiusItem = BorderRadius.all(Radius.circular(10));

List<BoxShadow> boxShadowItem = [
  BoxShadow(
    color: Colors.black.withOpacity(0.16),
    blurRadius: 4,
    offset: Offset(3, 3),
  )
];
const fontStyleMenuItem =
    TextStyle(fontFamily: "main", fontWeight: FontWeight.w700, fontSize: 18);
const fontStyleLegend =
    TextStyle(fontFamily: "main", fontSize: 14, color: Colors.grey);
const homeGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFFad5389),
    Color(0xFF3c1053),
  ],
);
const paymentGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF89216B),
    Color(0xFFDA4453),
  ],
);
const settingsGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFFFF416C),
    Color(0xFFFF4B2B),
  ],
);
