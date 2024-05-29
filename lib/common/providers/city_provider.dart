import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/models/city_model.dart';

final cityProvider = StateProvider<CityModel>((ref) => CityModel(
    name: 'Kochi', cityName: 'Kochi', country: 'India', countryCode: 'COK'));
