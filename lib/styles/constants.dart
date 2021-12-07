import 'package:flutter/material.dart';

const kMainBackgroundColor = const Color(0xFFeaeaea);
const kMainTextColor = const Color(0xFF254D60);
const kSecondColor = Color(0xFF3F8EFC);
const kPrimaryLabelColor = Color(0xFF242629);
const kSecondaryLabelColor = Color(0xFF797F8A);
const kThirdColor = Color(0xFFFF6978);
const double kHorizontalSpace = 16;
const double kVerticalSpacer = 26;
const double kDefaultWidth = 36;
const double kDefaultSpacer = 17;
const BorderRadius kBorderRadiusItem = BorderRadius.all(Radius.circular(10));

List<BoxShadow> kBoxShadowItem = [
  BoxShadow(
    color: Colors.black.withOpacity(0.16),
    blurRadius: 4,
    offset: Offset(3, 3),
  )
];
const kFontStyleMenuItem =
    TextStyle(fontFamily: "main", fontWeight: FontWeight.w700, fontSize: 18);
const fontStyleLegend =
    TextStyle(fontFamily: "main", fontSize: 14, color: Colors.grey);
const kHomeGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFFad5389),
    Color(0xFF3c1053),
  ],
);
const kPaymentGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF89216B),
    Color(0xFFDA4453),
  ],
);
const kSettingsGradientButton = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFFFF416C),
    Color(0xFFFF4B2B),
  ],
);

const kVoteStyle = TextStyle(
  fontFamily: "main",
  fontWeight: FontWeight.bold,
  color: kMainTextColor,
  fontSize: 15.0,
  decoration: TextDecoration.none,
);
// Text Styles
const kLargeTitleStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: "main",
  decoration: TextDecoration.none,
);
const kTitle1Style = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: "main",
  decoration: TextDecoration.none,
);

const kTitleSection = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.normal,
  color: kMainTextColor,
  fontFamily: "main",
  decoration: TextDecoration.none,
);

const kCardTitleStyle = TextStyle(
  fontFamily: "main",
  fontWeight: FontWeight.bold,
  color: kMainTextColor,
  fontSize: 15.0,
  decoration: TextDecoration.none,
);

const kTagLineStyle = TextStyle(
  fontFamily: "main",
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: kSecondColor,
  fontSize: 15.0,
  decoration: TextDecoration.none,
);

const kGenreStyle = TextStyle(
  fontFamily: "main",
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  color: kThirdColor,
  fontSize: 15.0,
  decoration: TextDecoration.none,
);
const kSubtitleStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: "main",
  decoration: TextDecoration.none,
);
const kCardSubtitleStyle = TextStyle(
  fontFamily: "main",
  color: Color(0xE6FFFFFF),
  fontSize: 13.0,
  decoration: TextDecoration.none,
);
const kCaptionLabelStyle = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColor,
  fontFamily: "main",
  decoration: TextDecoration.none,
);

var kLoginInputTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.black.withOpacity(0.3),
  fontFamily: "main",
  decoration: TextDecoration.none,
);
