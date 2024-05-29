import 'package:hive_flutter/adapters.dart';
import 'package:weather_riverpod/models/city_model.dart';
part 'city_entity.g.dart';

@HiveType(typeId: 2)
class CityEntity extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String country;
  @HiveField(2)
  final String countryCode;

  CityEntity({
    required this.country,
    required this.countryCode,
    required this.name,
  });

  factory CityEntity.fromModel(CityModel cityModel) {
    return CityEntity(
      country: cityModel.country ?? 'India',
      countryCode: cityModel.getCountryCode ?? 'IN',
      name: cityModel.cityName ?? cityModel.name ?? 'Kochi',
    );
  }
}
