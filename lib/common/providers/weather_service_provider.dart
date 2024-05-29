import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/dio_provider.dart';
import 'package:weather_riverpod/services/weather_service/weather_service.dart';

final weatherServiceProvider = Provider<WeatherService>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return WeatherService(dio: dio);
  },
);
