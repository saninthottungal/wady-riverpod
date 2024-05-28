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
          color: Color.fromARGB(255, 47, 47, 47),
        ),
        titleMedium: TextStyle(
          color: Color.fromARGB(255, 56, 56, 56),
        )),
  );

  //*dark theme

  static final darkTheme = ThemeData(
    //brightness
    brightness: Brightness.dark,
  );
}
