import 'package:hive_flutter/adapters.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/models/weather_entity/weather_entity.dart';

class DBFunctions {
  Future<void> addLocalWeather(WeatherEntity weather) async {
    final box = await Hive.openBox<WeatherEntity>(HiveKeys.boxKey);
    await box.put(HiveKeys.weatherKey, weather);
  }

  Future<WeatherEntity?> getLocalWeather() async {
    final box = await Hive.openBox<WeatherEntity>(HiveKeys.boxKey);
    return box.get(HiveKeys.weatherKey);
  }
}
