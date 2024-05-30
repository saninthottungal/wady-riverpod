import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/models/city_model.dart';
import 'package:weather_riverpod/screens/home/providers/hive_provider.dart';

final cityProvider =
    AsyncNotifierProvider<CityNotifier, CityModel>(CityNotifier.new);

class CityNotifier extends AsyncNotifier<CityModel> {
  @override
  FutureOr<CityModel> build() async {
    final weather = await ref.watch(localWeatherProvider.future);
    return CityModel(
      name: weather?.city.name ?? 'Kochi',
      cityName: weather?.city.name ?? 'Kochi',
      country: weather?.city.country ?? 'India',
      countryCode: weather?.city.countryCode ?? 'IN',
    );
  }

  Future<void> changeCity(CityModel cityModel) async {
    state = AsyncData(cityModel);
  }
}
