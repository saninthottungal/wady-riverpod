import 'package:flutter/material.dart';

class WeatherThemes {
  //*light Theme
  static final lightTheme = ThemeData(
    //brightness
    brightness: Brightness.light,

    //color Scheme
    colorSchemeSeed: const Color.fromARGB(255, 105, 147, 213),
  );

  //*dark theme

  static final darkTheme = ThemeData(
    //brightness
    brightness: Brightness.dark,
  );
}
