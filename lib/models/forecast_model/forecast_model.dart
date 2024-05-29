import 'package:json_annotation/json_annotation.dart';

import 'forecast.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: 'list')
  List<Forecast>? forecast;

  ForecastModel({this.forecast});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return _$ForecastModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
