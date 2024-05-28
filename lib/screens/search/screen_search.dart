import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child: TextField(
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
          const Divider(
            color: Colors.black12,
            indent: 60,
            endIndent: 60,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    child: const Icon(
                      Icons.pin_drop,
                      color: Colors.white70,
                    ),
                  ),
                  title: const Text("Vengara road, Kerala"),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black12,
                  indent: size.width * 0.2,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      )),
    );
  }
}
