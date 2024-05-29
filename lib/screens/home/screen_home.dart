import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_riverpod/common/providers/city_provider.dart';
import 'package:weather_riverpod/screens/home/providers/weather_provider.dart';
import 'package:weather_riverpod/screens/home/widgets/bottom_cover_container.dart';
import 'package:weather_riverpod/screens/home/widgets/city_text_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/expand_button_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/forecast_listview_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/theme_toggle_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/top_cover_container.dart';
import 'package:weather_riverpod/screens/home/widgets/weather_degree_widget.dart';
import 'package:weather_riverpod/screens/home/widgets/wind_humidity_widget.dart';

import 'providers/forecast_visibilty_provider.dart';

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isForecastVisible = ref.watch(isForecastCardVisibleProvider);
    final city = ref.watch(cityProvider);
    final date = DateTime.now();
    ref.watch(weatherProvider);

    return Scaffold(
      body: Stack(
        children: [
          //weirdly shaped container in the background(Top)
          const TopCoverContainer(),
          //weirdly shaped container in the background(Bottom)
          const BottomCoverContainer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Row of (City, Date, Theme Toggle, Search Icon)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          city.when(
                            data: (city) {
                              return CityTextWidget(
                                  text:
                                      '${city.cityName ?? city.name}, ${city.country}');
                            },
                            error: (err, stackTrace) {
                              ref.invalidate(cityProvider);
                              return Text(err.toString());
                            },
                            loading: () {
                              return const Skeletonizer(
                                  child: CityTextWidget(text: 'mock,mock'));
                            },
                          ),
                          const SizedBox(height: 5),
                          CityTextWidget(
                              text: "${date.day}.${date.month}.${date.year}"),
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
                              Navigator.pushNamed(context, '/search');
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //*Column of rest of the widgets
                  Column(
                    children: [
                      //weather degree and image widget
                      const WeatherDegreeWidget(),
                      Card.filled(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            // humidity and its value, wind and its value.
                            const WindHumidityWidget(),
                            if (isForecastVisible)
                              const Divider(
                                indent: 15,
                                endIndent: 15,
                              ),
                            if (isForecastVisible)
                              //*forecast details of 5 days.
                              const ForecastListviewWidget(),
                            //button for showing/hiding the forecast.
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
