import 'package:flutter/material.dart';
import 'package:simple_weather_app/views/search_view.dart';
import 'package:simple_weather_app/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: const NoWeatherBody(),
    );
  }
}
