class CityModel {
  final String? name;
  final String? cityName;
  final String? country;

  CityModel({
    required this.name,
    required this.cityName,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'],
      cityName: map['city_name'],
      country: map['country_name'],
    );
  }
}
