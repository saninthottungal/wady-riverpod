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
          print(imageUrl);
          final temparature = weather.main?.temp?.toStringAsFixed(1);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                height: 120,
              ),
              const SizedBox(width: 10),
              Text(
                "$temparature°C",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          );
        },
        error: (err, stack) => Text(err.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
