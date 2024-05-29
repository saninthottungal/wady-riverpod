import 'package:weather_riverpod/models/forecast_model/forecast.dart';

class ForecastEntity {
  final String? icon;
  final DateTime? date;
  final double? temp;

  ForecastEntity({
    required this.icon,
    required this.date,
    required this.temp,
  });

  factory ForecastEntity.fromModel(Forecast forecast) {
    final icon = forecast.weather?.first.icon;
    final dateAsUnix = forecast.dt;

    final date = dateAsUnix == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(dateAsUnix * 1000);

    final temp = forecast.main?.temp;

    return ForecastEntity(
      icon: icon,
      date: date,
      temp: temp,
    );
  }
}
