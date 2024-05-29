import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod/common/providers/city_provider.dart';
import 'package:weather_riverpod/screens/search/providers/city_search_provider.dart';

class ScreenSearch extends ConsumerWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final citiesProvider = ref.watch(cityListProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(left: 5),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Card(
                  margin: const EdgeInsets.only(
                      top: 25, bottom: 25, right: 25, left: 5),
                  child: TextField(
                    onChanged: (value) {
                      ref.read(cityListProvider.notifier).getCities(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search a City',
                      suffixIcon: IconButton(
                        tooltip: 'your location',
                        onPressed: () {
                          //TODO current location tracking
                        },
                        icon: const Icon(Icons.pin_drop),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black12,
            indent: 60,
            endIndent: 60,
          ),
          Expanded(
            child: citiesProvider.when(
              data: (cities) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        ref.read(cityProvider.notifier).state = cities[index];
                        Navigator.pop(context);
                      },
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white70,
                        ),
                      ),
                      title: Text(
                          cities[index].cityName ?? cities[index].name ?? ''),
                      subtitle: Text(cities[index].countryName ?? ''),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black12,
                      indent: size.width * 0.2,
                    );
                  },
                  itemCount: cities.length,
                );
              },
              error: (err, stack) => const Text("Couldn't load"),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      )),
    );
  }
}
