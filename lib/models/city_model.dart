import 'package:uuid/uuid.dart';

class CityModel {
  final String id;
  final String? name;
  final String? cityName;
  final String? _country;
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
