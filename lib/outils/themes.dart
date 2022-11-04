import 'dart:math';

import 'package:flutter/material.dart';


class Styles {
  Color randomColor() {
    return Color(Random().nextInt(0xFFFFFFFF));
  }

// Custom Colors


  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
        indicatorColor:
            isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
        hintColor:
            isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
        highlightColor:
            isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
        hoverColor:
            isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
        focusColor:
            isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        //  textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
        cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: Colors.grey[300],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
          unselectedItemColor: isDarkTheme ? Colors.white : Colors.black,
          backgroundColor: isDarkTheme ? Colors.black38 : Colors.white,
        ));
  }
}
