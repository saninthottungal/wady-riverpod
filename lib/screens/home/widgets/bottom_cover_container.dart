import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/forecast_provider.dart';

class BottomCoverContainer extends ConsumerWidget {
  const BottomCoverContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(400, 200),
          ),
        ),
        height: isForecastVisible ? size.height : size.height * 0.5,
      ),
    );
  }
}
