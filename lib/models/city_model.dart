import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

@HiveType(typeId: 2)
class CityModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? cityName;
  @HiveField(3)
  final String? _country;
  @HiveField(4)
  final String? _countryCode;

  CityModel({
    required this.name,
    required this.cityName,
    required String? country,
    required String? countryCode,
  })  : _country = country,
        id = const Uuid().v4(),
        _countryCode = countryCode;

  String? get country {
    if (_country == null) return _countryCode;
    return _country.length < 10 ? _country : _countryCode;
  }

  String? get getCountryName => _country;
  String? get getCountryCode => _countryCode;

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'],
      cityName: map['city_name'],
      country: map['country_name'],
      countryCode: map['country_code'],
    );
  }

  @override
  bool operator ==(Object other) => other is CityModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
