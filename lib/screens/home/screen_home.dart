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
    final size = MediaQuery.of(context).size;
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 247, 252),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(600, 350),
              ),
            ),
            height: size.height * 0.4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 242, 247, 252),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(400, 200),
                ),
              ),
              height: isForecastVisible ? size.height : size.height * 0.5,
            ),
          ),
          SafeArea(
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
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ],
                        ),
                      ),
                      Card.filled(
                        color: Colors.white,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        "223%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        "NE - 60km/h",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                                maxHeight: size.height * 0.35,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return const ListTile(
                                      leading: Icon(Icons.sunny),
                                      title: Text("nagaram"),
                                      trailing: Text("30"),
                                    );
                                  },
                                  itemCount: 5,
                                ),
                              ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(
                                        isForecastCardVisibleProvider.notifier)
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
        ],
      ),
    );
  }
}
