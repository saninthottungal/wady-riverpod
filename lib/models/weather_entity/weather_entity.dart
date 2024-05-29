import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_riverpod/models/city_entity/city_entity.dart';
import 'package:weather_riverpod/models/city_model.dart';
import 'package:weather_riverpod/models/weather_model/weather_model.dart';
part 'weather_entity.g.dart';

@HiveType(typeId: 1)
class WeatherEntity extends HiveObject {
  @HiveField(0)
  final CityEntity city;
  @HiveField(1)
  final double temparature;
  @HiveField(2)
  final int humidity;
  @HiveField(3)
  final double wind;

  WeatherEntity({
    required this.city,
    required this.temparature,
    required this.humidity,
    required this.wind,
  });

  factory WeatherEntity.fromModel(WeatherModel weatherModel, CityModel city) {
    return WeatherEntity(
      city: CityEntity.fromModel(city),
      temparature: weatherModel.main?.temp ?? 24,
      humidity: weatherModel.main?.humidity ?? 20,
      wind: weatherModel.wind?.speed ?? 10,
    );
  }
}
