import 'package:flutter/material.dart';

class WeatherThemes {
  //*light Theme
  static final lightTheme = ThemeData(
    //brightness
    brightness: Brightness.light,

    //color Scheme
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 169, 202, 255),
      secondary: Color.fromARGB(255, 242, 247, 252),
      inversePrimary: Color.fromARGB(255, 106, 154, 230),
    ),
    //card theme
    cardTheme: const CardTheme(
      elevation: 3,
    ),
    //text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color.fromARGB(255, 47, 47, 100),
      ),
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 100, 100, 100),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 56, 56, 56),
      ),
    ),
  );

  //*dark theme

  static final darkTheme = ThemeData(
    //brightness
    brightness: Brightness.dark,
    //color Scheme
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 106, 71, 46),
      secondary: Color.fromARGB(255, 33, 22, 14),
      inversePrimary: Color.fromARGB(255, 173, 147, 128),
    ),
    //card theme
    cardTheme: const CardTheme(
      elevation: 3,
    ),
    //text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color.fromARGB(255, 213, 213, 225),
      ),
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 200, 200, 200),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 156, 156, 156),
      ),
    ),
    //icon button
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.white70),
      ),
    ),
  );
}
