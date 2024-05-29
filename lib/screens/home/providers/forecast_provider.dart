import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/city_provider.dart';
import 'package:weather_riverpod/common/providers/weather_service_provider.dart';
import 'package:weather_riverpod/models/forecast_entity.dart';

class ForecastNotififer extends AsyncNotifier<List<ForecastEntity>> {
  @override
  FutureOr<List<ForecastEntity>> build() async {
    final weatherService = ref.watch(weatherServiceProvider);
    final cityModel = ref.watch(cityProvider);
    return weatherService.getForecastWeather(cityModel);
  }
}
