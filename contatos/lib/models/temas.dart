import 'package:flutter/material.dart';

class Temas {
  static ThemeData temaClaro = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFfefdfe),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF0000ff),
        onPrimary: Color(0xFFfefdfe),
        secondary: Color(0xFF010100),
        onSecondary: Color(0xFFfefdfe),
        error: Color(0xFFe80000),
        onError: Color(0xFFfefdfe),
        background: Color(0xFF0000ff),
        onBackground: Color(0xFFfefdfe),
        surface: Color(0xFFe80000),
        onSurface: Color(0xFFfefdfe)),
  );

  static ThemeData temaEscuro = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0e050f),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF04f9f2),
        onPrimary: Color(0xFF0e050f),
        secondary: Color(0xFFfefdfe),
        onSecondary: Color(0xFF0e050f),
        error: Color(0xFFe80000),
        onError: Color(0xFF0e050f),
        background: Color(0xFF04f9f2),
        onBackground: Color(0xFF0e050f),
        surface: Color(0xFFe80000),
        onSurface: Color(0xFF0e050f)),
  );
}
