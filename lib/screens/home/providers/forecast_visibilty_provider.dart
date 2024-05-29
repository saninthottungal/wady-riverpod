import 'package:flutter_riverpod/flutter_riverpod.dart';

final isForecastCardVisibleProvider =
    NotifierProvider<ForecastVisisblity, bool>(ForecastVisisblity.new);

class ForecastVisisblity extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void changeValue() {
    state = !state;
  }
}
