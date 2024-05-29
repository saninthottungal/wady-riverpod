import 'package:uuid/uuid.dart';

class CityModel {
  final String id;
  final String? name;
  final String? cityName;
  final String? country;

  CityModel({
    required this.name,
    required this.cityName,
    required this.country,
  }) : id = const Uuid().v4();

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'],
      cityName: map['city_name'],
      country: map['country_name'],
    );
  }

  @override
  bool operator ==(Object other) => other is CityModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
