import 'package:flutter/material.dart';

const List<Color> colorList = [
  ///
  /// RHEMA MENA Brand Colors
  ///
  Color(0xFFFFE7EC), //01 Primary/01 Ligher
  Color(0xFFE58B9D), //01 Primary/02 Light
  Color(0xFFBE0027), //01 Primary/03 Main
  Color(0xFF720017), //01 Primary/04 Dark
  Color(0xFF4C0010), //01 Primary/05 Darker
  Color(0xFFF4F4F4), //02 Secondary/01 Light
  Color(0xFFBEBEBE), //02 Secondary/02 Lighter
  Color(0xFF939393), //02 Secondary/03 Main
  Color(0xFF828282), //02 Secondary/04 Dark
  Color(0xFF3B3B3B), //02 Seconday/05 Darker
  Color(0xFF1890FF), //03 Info/03 Main
  Color(0xFF04297A), //03 Info/05 Darker
  Color(0xFF54D62C), //04 Success/03 Main
  Color(0xFF08660D), //04 Success/05 Darker
  Color(0xFFFFC107), //05 Warning/03 Main
  Color(0xFF7A4F01), //05 Warning/05 Darker
  Color(0xFFFF4842), //06 Error/03 Main
  Color(0xFF7A0C2E), //06 Error/05 Darker
  Color(0xFFF9FAFB), //07 Grey/100
  Color(0xFFF4F6F8), //07 Grey/200
  Color(0xFFDFE3E8), //07 Grey/300
  Color(0xFFC4CDD5), //07 Grey/400
  Color(0xFF919EAB), //07 Grey/500
  Color(0xFF637381), //07 Grey/600
  Color(0xFF454F5B), //07 Grey/700
  Color(0xFF212B36), //07 Grey/800
  Color(0xFF161C24), //07 Grey/900
  Color(0xFFFFFFFF), //08 Common/01 White
];

// Primary Colors
Color primaryLighter() {
  return const Color(0xFFFFE7EC); //01 Primary/01 Lighter
}

Color primaryLight() {
  return const Color(0xFFE58B9D); //01 Primary/02 Light
}

Color primaryMain() {
  return const Color(0xFFBE0027); //01 Primary/03 Main
}

Color primaryDark() {
  return const Color(0xFF720017); //01 Primary/04 Dark
}

Color primaryDarker() {
  return const Color(0xFF4C0010); //01 Primary/05 Darker
}

// Secondary Colors
Color secondaryLight() {
  return const Color(0xFFF4F4F4); //02 Secondary/01 Light
}

Color secondaryLighter() {
  return const Color(0xFFBEBEBE); //02 Secondary/02 Lighter
}

Color secondaryMain() {
  return const Color(0xFF939393); //02 Secondary/03 Main
}

Color secondaryDark() {
  return const Color(0xFF828282); //02 Secondary/04 Dark
}

Color secondaryDarker() {
  return const Color(0xFF3B3B3B); //02 Secondary/05 Darker
}

// Info Colors
Color infoMain() {
  return const Color(0xFF1890FF); //03 Info/03 Main
}

Color infoDarker() {
  return const Color(0xFF04297A); //03 Info/05 Darker
}

// Success Colors
Color successMain() {
  return const Color(0xFF54D62C); //04 Success/03 Main
}

Color successDarker() {
  return const Color(0xFF08660D); //04 Success/05 Darker
}

// Warning Colors
Color warningMain() {
  return const Color(0xFFFFC107); //05 Warning/03 Main
}

Color warningDarker() {
  return const Color(0xFF7A4F01); //05 Warning/05 Darker
}

// Error Colors
Color errorMain() {
  return const Color(0xFFFF4842); //06 Error/03 Main
}

Color errorDarker() {
  return const Color(0xFF7A0C2E); //06 Error/05 Darker
}

// Grey Colors
Color grey100() {
  return const Color(0xFFF9FAFB); //07 Grey/100
}

Color grey200() {
  return const Color(0xFFF4F6F8); //07 Grey/200
}

Color grey300() {
  return const Color(0xFFDFE3E8); //07 Grey/300
}

Color grey400() {
  return const Color(0xFFC4CDD5); //07 Grey/400
}

Color grey500() {
  return const Color(0xFF919EAB); //07 Grey/500
}

Color grey600() {
  return const Color(0xFF637381); //07 Grey/600
}

Color grey700() {
  return const Color(0xFF454F5B); //07 Grey/700
}

Color grey800() {
  return const Color(0xFF212B36); //07 Grey/800
}

Color grey900() {
  return const Color(0xFF161C24); //07 Grey/900
}

// Common Colors
Color commonWhite() {
  return const Color(0xFFFFFFFF); //08 Common/01 White
}

const headLine6 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  overflow: TextOverflow.ellipsis,
);

const headLine5 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

const headLine4 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine3 = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);

const headLine1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black54, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black12, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.redAccent),
);

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

///
/// RHEMA MENA Brand Typography
///
const subtitle1 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Color(0xff212b36),
  height: 24 / 16,
);

const regular12pxQuote = TextStyle(
  fontFamily: "Roboto",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  height: 17 / 12,
);

const subtitle2White = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xfffefefe),
  height: 22 / 14,
);

const subtitle2Grey = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xff212b36),
  height: 22 / 14,
);

const subtitle3 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xff203b54),
  height: 44 / 14,
);

const caption1 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff637381),
  height: 18 / 12,
);

const caption2 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff637381),
  height: 18 / 12,
);

const caption3 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff212b36),
  height: 18 / 12,
);

const h4 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Color(0xff010100),
  height: 36 / 24,
);

const h5 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color(0xff212b36),
  height: 30 / 20,
);

const h6 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: Color(0xff212b36),
  height: 28 / 18,
);

const buttonSmall = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 13,
  fontWeight: FontWeight.w700,
  color: Color(0xff212b36),
  height: 22 / 13,
);

const regular16pxP2 = TextStyle(
  fontFamily: "Roboto",
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xff212b36),
  height: 22 / 16,
);

const body2 = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff637381),
  height: 22 / 14,
);

const body2Grey = TextStyle(
  fontFamily: "Helvetica Neue",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff364f65),
  height: 264 / 14,
);
