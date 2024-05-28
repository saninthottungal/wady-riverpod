import 'package:flutter/material.dart';
import 'package:weather_riverpod/screens/home/widgets/custom_row_widget.dart';

class WindHumidityWidget extends StatelessWidget {
  const WindHumidityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          CustomRowWidget(label: 'Humidity', trailing: '223%'),
          SizedBox(height: 15),
          CustomRowWidget(label: 'wind', trailing: 'NE - 60 km/h'),
        ],
      ),
    );
  }
}
