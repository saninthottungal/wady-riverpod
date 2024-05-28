import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/providers/shared_preferences_provider.dart';
import '../../../core/constants.dart';
import '../../../core/enums/theme_enum.dart';
import '../../../core/themes/providers/theme_provider.dart';

class ThemeToggleWidget extends ConsumerWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return IconButton(
      onPressed: () async {
        ref.read(themeProvider.notifier).switchTheme();
        final instance = await ref.read(sharedPreferencesProvider.future);
        final tempCurrentTheme = ref.read(themeProvider);
        instance.setBool(
          themeKey,
          tempCurrentTheme == Themes.light ? true : false,
        );
      },
      icon: Icon(
        currentTheme == Themes.light
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined,
      ),
    );
  }
}
