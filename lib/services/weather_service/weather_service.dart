import 'package:dio/dio.dart';
import 'package:weather_riverpod/core/.keys.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/models/city_model.dart';
import 'package:weather_riverpod/models/weather_model/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather(CityModel cityModel) async {
    final citynName = cityModel.cityName ?? cityModel.name;
    final countryCode = cityModel.getCountryCode;
    final baseUrl =
        weatherBaseUrl.replaceAll('placesValues', '$citynName,$countryCode');
    const apiUrl = weatherApiurl + WeatherKeys.weatherApiKey;

    final response = await dio.get(baseUrl + apiUrl);
    final responseAsMap = response.data as Map<String, dynamic>;
    print(responseAsMap);
    return WeatherModel.fromJson(responseAsMap);
  }
}
