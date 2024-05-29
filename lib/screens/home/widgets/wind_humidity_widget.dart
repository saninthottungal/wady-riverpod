import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/screens/home/providers/hive_provider.dart';
import 'package:weather_riverpod/screens/home/providers/weather_provider.dart';
import 'package:weather_riverpod/screens/home/widgets/custom_row_widget.dart';

class WindHumidityWidget extends ConsumerWidget {
  const WindHumidityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    final localWeather = ref.watch(localWeatherProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: weather.when(
        data: (weather) {
          final humidity = weather.main?.humidity.toString();
          final wind = weather.wind?.speed.toString();
          return Column(
            children: [
              CustomRowWidget(label: 'Humidity', trailing: '$humidity%'),
              const SizedBox(height: 15),
              CustomRowWidget(label: 'wind', trailing: '$wind m/s'),
            ],
          );
        },
        error: (err, stack) => localWeather.when(
          data: (weather) {
            return Column(
              children: [
                CustomRowWidget(
                    label: 'Humidity', trailing: '${weather?.humidity ?? 10}%'),
                const SizedBox(height: 15),
                CustomRowWidget(
                    label: 'wind',
                    trailing: '${weather?.wind.toStringAsFixed(1)} m/s'),
              ],
            );
          },
          error: (localErro, localStack) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
