import 'package:flutter/material.dart';

class myTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color backgroundColor = Color(0xffDFECDB);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff383838);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color grayColor = Color(0xffafaeae);
  static Color backgroundDark = Color(0xff060E1E);
  static Color blackDark = Color(0xff141922);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(color: primaryLight, elevation: 0),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
          titleMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: whiteColor,
          selectedItemColor: primaryLight,
          unselectedItemColor: grayColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryLight,
          shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 4))));
  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(color: primaryLight, elevation: 0),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
          titleMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
          titleSmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: blackColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: blackDark,
          selectedItemColor: primaryLight,
          unselectedItemColor: grayColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryLight,
          shape: StadiumBorder(side: BorderSide(color: blackDark, width: 4))));
}
