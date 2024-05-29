import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_riverpod/screens/home/providers/forecast_provider.dart';

class ForecastListviewWidget extends ConsumerWidget {
  const ForecastListviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final forecast = ref.watch(forecastProvider);
    return LimitedBox(
      maxHeight: size.height * 0.35,
      child: forecast.when(
        data: (forecast) {
          return ListView.builder(
            itemBuilder: (context, index) {
              //!exception handling
              final date = forecast[index].date!;
              final day = formatDate(date);

              return ListTile(
                leading: const Icon(Icons.sunny),
                title: Text(day),
                trailing: Text('${forecast[index].temp?.toStringAsFixed(1)}°C'),
              );
            },
            itemCount: 5,
          );
        },
        error: (err, stack) => Text(err.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  String formatDate(DateTime date) {
    final dateNow = DateTime.now();
    if (date.day == dateNow.day) {
      return 'Today';
    } else if (date.day == dateNow.day + 1) {
      return 'Tomorrow';
    } else {
      return DateFormat('EEE, d MMMM').format(date);
    }
  }
}
