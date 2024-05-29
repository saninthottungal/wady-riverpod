import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/dio_provider.dart';
import 'package:weather_riverpod/models/city_model.dart';
import 'package:weather_riverpod/services/city_search/city_search.dart';

//* city search Instance

final citySearchInstanceProvider = Provider(
  (ref) {
    final dio = ref.watch(dioProvider);
    return CitySearch(dio: dio);
  },
);

//* city List Provider (Future Provider)

final cityListProvider =
    AsyncNotifierProvider<CityListNotifier, List<CityModel>>(
        CityListNotifier.new);

//notifer class

class CityListNotifier extends AsyncNotifier<List<CityModel>> {
  @override
  Future<List<CityModel>> build() async {
    return [];
  }

  Future<void> getCities(String value) async {
    final instace = ref.read(citySearchInstanceProvider);
    final cities = await instace.getCities(value);
    state = AsyncData(cities);
  }
}
