import 'package:dio/dio.dart';
import 'package:weather_riverpod/core/.keys.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/models/city_model.dart';
import 'package:weather_riverpod/models/day_weather_model.dart';
import 'package:weather_riverpod/models/forecast_model/forecast_model.dart';
import 'package:weather_riverpod/models/weather_model/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  //! handle exceptions
  //? change to query parameters

  Future<WeatherModel> getCurrentWeather(CityModel cityModel) async {
    final cityName = cityModel.cityName ?? cityModel.name;
    final countryCode = cityModel.getCountryCode;
    final baseUrl =
        weatherBaseUrl.replaceAll('placesValues', '$cityName,$countryCode');
    const apiUrl = weatherApiurl + WeatherKeys.weatherApiKey;

    final response = await dio.get(baseUrl + apiUrl);
    final responseAsMap = response.data as Map<String, dynamic>;

    return WeatherModel.fromJson(responseAsMap);
  }

  Future<List<ForecastEntity>> getForecastWeather(CityModel cityModel) async {
    final cityName = cityModel.cityName ?? cityModel.name;
    final countryCode = cityModel.getCountryCode;

    final Map<String, dynamic> queryParameters = {
      'q': '$cityName,$countryCode',
      'units': 'metric',
      'appid': WeatherKeys.weatherApiKey,
    };
    final response = await dio.get(
      forecastApiBaseUrl,
      queryParameters: queryParameters,
    );
    final responseAsMap = response.data as Map<String, dynamic>;
    final forecastModels = ForecastModel.fromJson(responseAsMap);
    final dayWeatherModels = forecastModels.forecast
        ?.map((forecast) => ForecastEntity.fromModel(forecast))
        .toList();
    if (dayWeatherModels == null) return [];
    final values = dayWeatherModels.fold<List<ForecastEntity>>(
      [],
      (previousValue, element) {
        final dates = previousValue.map((e) => e.date?.day).toList();

        if (!dates.contains(element.date?.day)) {
          previousValue.add(element);
        }
        return previousValue;
      },
    );
    return values;
  }
}
