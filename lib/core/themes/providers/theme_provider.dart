import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../enums/theme_enum.dart';

final themeProvider = NotifierProvider<ThemeNotifer, Themes>(ThemeNotifer.new);

class ThemeNotifer extends Notifier<Themes> {
  @override
  Themes build() {
    return Themes.light;
  }

  void switchTheme() {
    state = state == Themes.light ? Themes.dark : Themes.light;
  }
}
