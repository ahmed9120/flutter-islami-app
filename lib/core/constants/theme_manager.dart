import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

abstract class ThemeManger{
  static ThemeData themeData= ThemeData(
    primaryColor:ColorsPallete.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsPallete.quranDetailsColor,
      iconTheme: IconThemeData(
        color: ColorsPallete.primaryColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColorsPallete.primaryColor,
        fontFamily: "Janna",

      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsPallete.primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      selectedLabelStyle:TextStyle(
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      unselectedItemColor: Colors.black87,
    ),
    textTheme: TextTheme(
      headlineMedium:TextStyle(
        fontSize: 36,
        fontFamily: "Janna",
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontFamily: "Janna",
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontFamily: "Janna",
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: "Janna",
        color: Color(0xFFFFFFE8),
        fontWeight: FontWeight.w700,
      ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: "Janna",
          color: Color(0xFFFFFFE8),
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: "Janna",
          color: Color(0xFFFFFFE8),
          fontWeight: FontWeight.w700,
        ),

    )
  );
}