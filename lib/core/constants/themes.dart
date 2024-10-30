import 'package:duolingo/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'fonts.dart';

class Themes {
  static ThemeData get themeData => ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: Sizes.largeTitleFont,
            fontWeight: FontWeight.bold,
            color: const Color(0xAC000000),
            height: 1.8,
          ),
          bodyMedium: TextStyle(
            fontSize: Sizes.mainFont,
// fontWeight: FontWeight.bold,
            color: const Color(0xAC000000),
          ),
          bodyLarge: TextStyle(
            fontSize: Sizes.largeFont,
// fontWeight: FontWeight.bold,
            color: const Color(0xAC000000),
          ),
          displayMedium: TextStyle(
            fontSize: Sizes.mainFont,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
              fontSize: Sizes.mainFont,
              fontWeight: FontWeight.bold,
              color: Colors.black38),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: Fonts.din,
      );
}
