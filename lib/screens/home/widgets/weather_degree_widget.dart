import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/core/constants.dart';
import 'package:weather_riverpod/screens/home/providers/weather_provider.dart';

class WeatherDegreeWidget extends ConsumerWidget {
  const WeatherDegreeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
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
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox();
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
        error: (err, stack) => Text(err.toString()),
        //!skelton
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
