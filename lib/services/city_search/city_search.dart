import 'package:dio/dio.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/models/city_model.dart';

class CitySearch {
  final Dio dio;

  CitySearch({required this.dio});
  Future<List<CityModel>> getCities(String value) async {
    Response response;
    try {
      response = await dio.get(citySearchBaseUrl + value);
    } on DioException {
      throw Exception('Network Error!');
    }
    if (response.statusCode == 200) {
      if (response.data == null) return [];
      final responseAsList = response.data as List;
      final cities = responseAsList.map((dynamicMap) {
        final map = dynamicMap as Map<String, dynamic>;
        return CityModel.fromJson(map);
      }).toList();

      return cities;
    } else {}
    return [];
  }
}
