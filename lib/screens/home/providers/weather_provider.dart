import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/models/weather_model/main.dart';
import 'package:weather_riverpod/models/weather_model/weather.dart';
import 'package:weather_riverpod/models/weather_model/weather_model.dart';
import 'package:weather_riverpod/models/weather_model/wind.dart';

final weatherProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherModel>(WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<WeatherModel> {
  @override
  FutureOr<WeatherModel> build() {
    return WeatherModel(
        weather: [
          Weather(
            main: 'rain',
            icon: '10d',
          ),
        ],
        main: Main(
          temp: 33,
          humidity: 150,
        ),
        wind: Wind(
          speed: 10,
        ));
  }
}
