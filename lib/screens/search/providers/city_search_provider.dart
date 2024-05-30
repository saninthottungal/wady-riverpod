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
  Timer? _timer;
  @override
  Future<List<CityModel>> build() async {
    return [];
  }

  //! Handle exceptions and empty values

  Future<void> getCities(String value) async {
    final instace = ref.read(citySearchInstanceProvider);
    if (value.isEmpty) return;
    state = const AsyncLoading();
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), () async {
      final cities = await instace.getCities(value);

      state = AsyncData(cities);
    });
  }
}
