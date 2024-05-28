class CityModel {
  final String? city;
  final String? country;

  CityModel({required this.city, required this.country});

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      city: map['LocalizedName'],
      country: map['Country']['LocalizedName'],
    );
  }
}
