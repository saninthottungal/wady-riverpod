import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  int? dt;
  Main? main;
  List<Weather>? weather;

  Forecast({this.dt, this.main, this.weather});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
