import 'package:rhema_mena_student_app/core/app_string.dart';
import 'package:rhema_mena_student_app/core/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      backgroundColor: Color(0xFF3A3A3A),
      centerTitle: true,
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFBE0027), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      border: inputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBE0027),
        textStyle: const TextStyle(
          fontFamily: "Helvetica Neue",
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Color(0xffFFFFFF),
          height: 26 / 15,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFBE0027),
    ),
    fontFamily: AppString.appFont,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      dialHandColor: const Color(0xFFF4511E),
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? const Color(0xFFF4511E)
            : Colors.black12,
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? Colors.black54
            : Colors.grey,
      ),
      dayPeriodBorderSide: const BorderSide(color: Colors.grey),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      dayPeriodColor: Colors.transparent,
      dayPeriodTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? const Color(0xFFF4511E)
            : Colors.black12,
      ),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black12),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      modalBackgroundColor: Colors.white,
      modalElevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),

    // Define your primary and accent colors here
    primaryColor: primaryMain(),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF637381),
      unselectedItemColor: Color(0xFF637381),
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      selectedLabelStyle: TextStyle(
        color: Color(0xFFBE0027),
        fontSize: 10,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      unselectedLabelStyle: TextStyle(
        color: Color(0xFF637381),
        fontSize: 10,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFBE0027),
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF637381),
        size: 24,
      ),
    ),
  );
}
