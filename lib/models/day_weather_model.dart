import 'package:weather_riverpod/models/forecast_model/forecast.dart';

class DayWeatherModel {
  final String? icon;
  final DateTime? date;
  final double? temp;

  DayWeatherModel({
    required this.icon,
    required this.date,
    required this.temp,
  });

  factory DayWeatherModel.fromModel(Forecast forecast) {
    final icon = forecast.weather?.first.icon;
    final dateAsUnix = forecast.dt;

    final date = dateAsUnix == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(dateAsUnix * 1000);

    final temp = forecast.main?.temp;

    return DayWeatherModel(
      icon: icon,
      date: date,
      temp: temp,
    );
  }
}
