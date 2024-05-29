import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/db_functions_provider.dart';
import 'package:weather_riverpod/models/weather_entity/weather_entity.dart';

class LocalWeatherNotifier extends AsyncNotifier<WeatherEntity?> {
  @override
  FutureOr<WeatherEntity?> build() {
    final instace = ref.watch(dbFunctionsProvider);
    return instace.getLocalWeather();
  }

  Future<void> addLocalWeather(WeatherEntity weather) async {
    final instance = ref.read(dbFunctionsProvider);
    await instance.addLocalWeather(weather);
  }
}
