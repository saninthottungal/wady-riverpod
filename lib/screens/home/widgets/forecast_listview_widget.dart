import 'package:flutter/material.dart';

class ForecastListviewWidget extends StatelessWidget {
  const ForecastListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LimitedBox(
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
    );
  }
}
