import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:simple_weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:simple_weather_app/views/search_view.dart';
import 'package:simple_weather_app/widgets/no_weather_body.dart';
import 'package:simple_weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            } else {
              return const Center(
                  child: Text("Oops there error")); // will make error page
            }
          },
        ));
  }
}
