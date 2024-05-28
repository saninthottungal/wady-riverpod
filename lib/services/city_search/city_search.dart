import 'package:dio/dio.dart';
import 'package:weather_riverpod/core/.keys.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/models/city_model.dart';

class CitySearch {
  final Dio dio;

  CitySearch({required this.dio});

  //! Exception Handling Pending

  Future<List<CityModel>> getCities(String value) async {
    const apiKey = WeatherKeys.citySearchApiKey;
    final queryParameters = {'apikey': apiKey, 'q': value};
    final response =
        await dio.get(citySearchBaseUrl, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      final responseAsList = response as List<Map<String, dynamic>>;

      final cities =
          responseAsList.map((map) => CityModel.fromJson(map)).toList();
      return cities;
    }
    return [];
  }
}
