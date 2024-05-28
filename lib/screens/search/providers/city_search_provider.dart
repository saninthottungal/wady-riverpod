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
    FutureProvider.family<List<CityModel>, String>((ref, String value) {
  final citySearchInstance = ref.watch(citySearchInstanceProvider);
  return citySearchInstance.getCities(value);
});
