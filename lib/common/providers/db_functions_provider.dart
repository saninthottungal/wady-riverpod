import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/services/db/db_functions.dart';

final dbFunctionsProvider = Provider<DBFunctions>((ref) => DBFunctions());
