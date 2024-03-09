import 'package:flutter/material.dart';

class MyTheme {
  static Color whiteColor = const Color(0xffffffff);
  static Color primaryColor = const Color(0xff39A552);
  static Color redColor = const Color(0xffC91C22);
  static Color pinkColor = const Color(0xffED1E79);
  static Color lightBlueColor = const Color(0xff4882CF);
  static Color darkBlueColor = const Color(0xff003E90);
  static Color brownColor = const Color(0xffCF7E48);
  static Color yellowColor = const Color(0xffF2D352);
  static Color blackColor = const Color(0xff303030);
  static Color grayColor = const Color(0xffA3A3A3);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: blackColor,
          ),
          titleSmall: TextStyle(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.w400)));
}
