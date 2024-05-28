import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/screens/home/widgets/bottom_cover_container.dart';
import 'package:weather_riverpod/screens/home/widgets/city_text_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/expand_button_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/forecast_listview_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/theme_toggle_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/top_cover_container.dart';
import 'package:weather_riverpod/screens/home/widgets/weather_degree_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/wind_humidity_widget.dart';

import 'providers/forecast_provider.dart';

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);

    return Scaffold(
      body: Stack(
        children: [
          const TopCoverContainer(),
          const BottomCoverContainer(),
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
                          CityTextWidget(text: "25.08.2.2022"),
                        ],
                      ),
                      Row(
                        children: [
                          const ThemeToggleWidget(),
                          const SizedBox(width: 10),
                          IconButton.filled(
                            padding: const EdgeInsets.all(17),
                            iconSize: 20,
                            onPressed: () {
                              //*Navigating to search page
                              Navigator.pushNamed(context, '/search');
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const WeatherDegreeWidget(),
                      Card.filled(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const WindHumidityWidget(),
                            if (isForecastVisible)
                              const Divider(
                                indent: 15,
                                endIndent: 15,
                              ),
                            if (isForecastVisible)
                              const ForecastListviewWidget(),
                            const ExpandButtonWidget(),
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
