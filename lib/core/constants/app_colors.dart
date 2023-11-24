import 'package:flutter/material.dart';

/// Appcolors from the desing system

class AppColors {
  AppColors._();
  static const Color basePrimary = Color(0XFF4A3391);
  static const Color baseSecondary = Color(0XFFF17A21);
  static const Color baseGreen = Color(0XFF3ec429);
  static const Color baseDark = Color(0XFF181e32);
  static const Color baseBlack = Color(0XFF262932);
  static const Color baseGrey = Color(0XFF8D8D8D);
  static const Color baseWhite = Color(0XFFffffff);

  static MaterialColor primary = MaterialColor(
    basePrimary.value,
    const <int, Color>{
      50: Color(0xFFede8f4),
      100: Color(0xFFd1c7e5),
      200: Color(0xFFb3a2d4),
      300: Color(0xFF957cc3),
      400: Color(0xFF7e60b6),
      500: Color(0xFF6946aa),
      600: Color(0xFF6141a3),
      700: Color(0xFF55399a),
      800: Color(0xFF4b3391),
      900: Color(0xFF3a2880)
    },
  );

  static MaterialColor secondary = MaterialColor(
    baseSecondary.value,
    const <int, Color>{
      50: Color(0xFFfffce7),
      100: Color(0xFFfff7c4),
      200: Color(0xFFfff29d),
      300: Color(0xFFffed77),
      400: Color(0xFFfee858),
      500: Color(0xFFfce23b),
      600: Color(0xFFfcd33a),
      700: Color(0xFFfabb33),
      800: Color(0xFFf7a32c),
      900: Color(0xFFf17b21)
    },
  );

  static MaterialColor dark = MaterialColor(
    baseDark.value,
    const <int, Color>{
      50: Color(0xFFf4f8ff),
      100: Color(0xFFeef3ff),
      200: Color(0xFFe6ebff),
      300: Color(0xFFd8dcf8),
      400: Color(0xFFb5b9d4),
      500: Color(0xFF959ab4),
      600: Color(0xFF6d718a),
      700: Color(0xFF595d75),
      800: Color(0xFF3a3f55),
      900: Color(0xFF181e32)
    },
  );

  static MaterialColor green = MaterialColor(
    baseGreen.value,
    const <int, Color>{
      50: Color(0xFFeaf9e7),
      100: Color(0xFFcceec2),
      200: Color(0xFFa9e29a),
      300: Color(0xFF83d670),
      400: Color(0xFF63cd4e),
      500: Color(0xFF3ec429),
      600: Color(0xFF2bb421),
      700: Color(0xFF00a016),
      800: Color(0xFF008b09),
      900: Color(0xFF006900)
    },
  );

  static MaterialColor black = MaterialColor(
    baseBlack.value,
    const <int, Color>{
      50: Color(0xFFf8fbff),
      100: Color(0xFFf3f6ff),
      200: Color(0xFFeef2fe),
      300: Color(0xFFe5e9f5),
      400: Color(0xFFc3c7d3),
      500: Color(0xFFa6a9b4),
      600: Color(0xFF7c7f8a),
      700: Color(0xFF676a75),
      800: Color(0xFF484b55),
      900: Color(0xFF262932)
    },
  );

  ///500 Background color
  static MaterialColor white = MaterialColor(
    baseWhite.value,
    const <int, Color>{
      50: Color(0xFFf8fbff),
      100: Color(0xFFf3f6ff),
      200: Color(0xFFeef2fe),
      300: Color(0xFFe5e9f5),
      400: Color(0xFFc3c7d3),
      500: Color(0xFFF9F9F9),
      600: Color(0xFF7c7f8a),
      700: Color(0xFF676a75),
      800: Color(0xFF484b55),
      900: Color(0xFF262932)
    },
  );

  static MaterialColor grey = MaterialColor(
    baseGrey.value,
    const <int, Color>{
      50: Color(0xFFfcfcfd),
      100: Color(0xFFf7f7f8),
      200: Color(0xFFf2f2f3),
      300: Color(0xFFeaeaeb),
      400: Color(0xFFc8c8c9),
      500: Color(0xFFaaaaab),
      600: Color(0xFF808081),
      700: Color(0xFF6b6b6c),
      800: Color(0xFF4c4c4d),
      900: Color(0xFF2a2a2b)
    },
  );
}
