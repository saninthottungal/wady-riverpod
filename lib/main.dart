import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_riverpod/common/providers/shared_preferences_provider.dart';
import 'package:weather_riverpod/core/enums/theme_enum.dart';
import 'package:weather_riverpod/core/themes/providers/theme_provider.dart';
import 'package:weather_riverpod/core/themes/theme.dart';
import 'package:weather_riverpod/models/city_entity/city_entity.dart';
import 'package:weather_riverpod/models/weather_entity/weather_entity.dart';
import 'package:weather_riverpod/screens/home/screen_home.dart';
import 'package:weather_riverpod/screens/search/screen_search.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(WeatherEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(CityEntityAdapter());
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sharedPreferencesProvider);
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme == Themes.light
          ? WeatherThemes.lightTheme
          : WeatherThemes.darkTheme,
      routes: {
        '/': (context) => const ScreenHome(),
        '/search': (context) => const ScreenSearch(),
      },
    );
  }
}
