import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_riverpod/models/city_entity/city_entity.dart';
part 'weather_entity.g.dart';

@HiveType(typeId: 1)
class WeatherEntity extends HiveObject {
  @HiveField(0)
  final CityEntity city;
  @HiveField(1)
  final double temparature;
  @HiveField(2)
  final double humidity;
  @HiveField(3)
  final double wind;

  WeatherEntity({
    required this.city,
    required this.temparature,
    required this.humidity,
    required this.wind,
  });
}
