import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'weather.dart';
import 'wind.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  List<Weather>? weather;
  Main? main;
  Wind? wind;

  WeatherModel({this.weather, this.main, this.wind});

  @override
  String toString() {
    return 'WeatherModel(weather: $weather, main: $main, wind: $wind)';
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
