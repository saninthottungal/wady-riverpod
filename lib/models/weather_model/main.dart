import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  int? humidity;

  Main({this.temp, this.feelsLike, this.humidity});

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, humidity: $humidity)';
  }

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
