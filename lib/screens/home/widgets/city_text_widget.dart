import 'package:flutter/material.dart';

class CityTextWidget extends StatelessWidget {
  const CityTextWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 19),
    );
  }
}
