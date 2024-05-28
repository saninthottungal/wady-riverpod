import 'package:flutter/material.dart';

class TopCoverContainer extends StatelessWidget {
  const TopCoverContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.elliptical(600, 350),
        ),
      ),
      height: size.height * 0.4,
    );
  }
}
