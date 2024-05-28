import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/providers/home_providers/forecast_provider.dart';
import 'package:weather_riverpod/screens/home/widgets/city_text_widget.dart';

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Humidity",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "223%",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "wind",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "NE - 60km/h",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (isForecastVisible)
                          const Divider(
                            indent: 15,
                            endIndent: 15,
                          ),
                        if (isForecastVisible)
                          LimitedBox(
                            maxHeight: 300,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return const ListTile(
                                  title: Text("nagaram"),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(isForecastCardVisibleProvider.notifier)
                                .changeValue();
                          },
                          icon: Icon(
                            isForecastVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
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
