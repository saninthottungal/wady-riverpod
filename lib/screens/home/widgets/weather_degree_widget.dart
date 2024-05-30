import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/screens/home/providers/hive_provider.dart';
import 'package:weather_riverpod/screens/home/providers/weather_provider.dart';

class WeatherDegreeWidget extends ConsumerWidget {
  const WeatherDegreeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final weather = ref.watch(weatherProvider);
    final localWeather = ref.watch(localWeatherProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: weather.when(
        data: (weather) {
          final imageUrl = weatherImageUrl.replaceAll(
              'imageCode', '${weather.weather?.first.icon}');

          final temparature = weather.main?.temp?.toStringAsFixed(1);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: const CircleBorder(),
                child: Image.network(
                  imageUrl,
                  height: size.width * 0.31,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        shape: BoxShape.circle,
                      ),
                      height: size.width * 0.31,
                      width: size.width * 0.31,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "$temparature°C",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          );
        },
        //!Exception
        error: (err, stack) => localWeather.when(
          data: (weather) => Text(
            "${weather?.temparature.toStringAsFixed(1) ?? 0}°C",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          error: (localError, localStack) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
        //!skelton
        loading: () {
          return Skeletonizer(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  shape: BoxShape.circle,
                ),
                height: size.width * 0.31,
                width: size.width * 0.31,
              ),
              const SizedBox(width: 10),
              Text(
                BoneMock.time,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ));
        },
      ),
    );
  }
}
