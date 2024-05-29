import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/city_provider.dart';
import 'package:weather_riverpod/common/providers/weather_service_provider.dart';
import 'package:weather_riverpod/models/weather_model/weather_model.dart';

final weatherProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherModel>(WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<WeatherModel> {
  @override
  FutureOr<WeatherModel> build() async {
    final weatherService = ref.watch(weatherServiceProvider);
    final city = ref.watch(cityProvider);
    final data = await weatherService.getWeather(city);
    return data;
  }
}
