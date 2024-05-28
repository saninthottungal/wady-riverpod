import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_riverpod/screens/home/widgets/city_text_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      CityTextWidget(text: 'Lille, France'),
                      SizedBox(height: 5),
                      CityTextWidget(text: "29.08.2.2022"),
                    ],
                  ),
                  IconButton.filled(
                    iconSize: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
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
                        Text("24°C",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Humidity",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                "223",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "wind",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                "NE - 60km/h",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
