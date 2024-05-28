import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/core/themes/theme.dart';
import 'package:weather_riverpod/screens/home/screen_home.dart';
import 'package:weather_riverpod/screens/search/screen_search.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: WeatherThemes.lightTheme,
      routes: {
        '/': (context) => const ScreenHome(),
        '/search': (context) => const ScreenSearch(),
      },
    );
  }
}
