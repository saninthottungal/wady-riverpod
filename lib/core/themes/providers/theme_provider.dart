import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/shared_preferences_provider.dart';
import 'package:weather_riverpod/core/constants.dart';
import '../../enums/theme_enum.dart';

final themeProvider = NotifierProvider<ThemeNotifer, Themes>(ThemeNotifer.new);

class ThemeNotifer extends Notifier<Themes> {
  @override
  Themes build() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return sharedPreferences.when(
        data: (instace) {
          final isLightTheme = instace.getBool(themeKey);
          if (isLightTheme != null) {
            return isLightTheme ? Themes.light : Themes.dark;
          } else {
            return Themes.light;
          }
        },
        error: (err, e) => Themes.light,
        loading: () => Themes.light);
  }

  void switchTheme() {
    state = state == Themes.light ? Themes.dark : Themes.light;
  }
}
