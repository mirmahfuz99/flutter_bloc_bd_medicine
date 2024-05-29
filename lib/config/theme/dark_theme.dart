import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: const Color(0xFF7455F7),
  primaryColorLight: const Color(0xFFF0F4F8),
  primaryColorDark: const Color(0xFF10324A),
  secondaryHeaderColor: const Color(0xFF9BB8DA),
  textTheme: const TextTheme(titleMedium: TextStyle(color: Color(0xFF80CBC4))),
  disabledColor: const Color(0xFF8797AB),
  scaffoldBackgroundColor: const Color(0xFF12151C),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFC0BFBF),
  focusColor: const Color(0xFF484848),
  hoverColor: const Color(0x400461A5),
  shadowColor: const Color(0x33e2f1ff),
  cardColor: const Color(0xFF20242F),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFFFFFF))), colorScheme: const ColorScheme.dark(primary: Color(0xFF056AB4), secondary: Color(0xFFf57d00), tertiary: (Color(0xFFFF6767))).copyWith(background: const Color(0xff010D15)),
);

// semi-dark-light-color