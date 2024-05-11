import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_weather_app/models/weather_model.dart';
import 'package:simple_weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search A City "),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel =
                  await WeatherService().getCurrentweather(cityQuery: value);
              log(weatherModel.cityName);
            },
            decoration: const InputDecoration(
                hintText: 'Enter City Name',
                labelText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ))),
          ),
        ),
      ),
    );
  }
}
