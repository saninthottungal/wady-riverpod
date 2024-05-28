import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/forecast_provider.dart';

class ExpandButtonWidget extends ConsumerWidget {
  const ExpandButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);
    return IconButton(
      onPressed: () {
        ref.read(isForecastCardVisibleProvider.notifier).changeValue();
      },
      icon: Icon(
        isForecastVisible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      ),
    );
  }
}
