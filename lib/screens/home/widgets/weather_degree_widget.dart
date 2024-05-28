import 'package:flutter/material.dart';

class WeatherDegreeWidget extends StatelessWidget {
  const WeatherDegreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            """https://thumbs.dreamstime.com/z/
                        smiling-sun-illustration-character-34434947.jpg?ct=jpeg""",
            height: 120,
          ),
          const SizedBox(width: 10),
          Text("24°C", style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
    );
  }
}
