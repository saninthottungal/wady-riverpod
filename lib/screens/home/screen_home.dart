import 'package:flutter/material.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        """https://thumbs.dreamstime.com/z/
                    smiling-sun-illustration-character-34434947.jpg?ct=jpeg""",
                        height: 120,
                      ),
                      const Text(
                        "24°C",
                        style: TextStyle(fontSize: 55),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: md.size.width * 0.9,
                    color: Colors.black12,
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Humidity"),
                            Text("223"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("wind"),
                            Text("445"),
                          ],
                        ),
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
