import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:simple_weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:simple_weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                      condition: BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.conditions,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        }));
  }
}

List<Color> getThemeColors({required String? condition}) {
  return [
    getThemeColor(condition: condition),
    getThemeColor(condition: condition)[300]!,
    getThemeColor(condition: condition)[200]!,
    getThemeColor(condition: condition)[50]!,
  ];
}

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Clear':
      return Colors.yellow;
    case 'Partially cloudy':
    case 'partly-cloudy-night':
      return Colors.blue;
    case 'clear-night':
      return Colors.indigo;
    case 'Overcast':
      return Colors.grey;
    case 'Rain, Overcast':
    case 'Rain, Partially cloudy':
      return Colors.blueGrey;
    default:
      return Colors.lightBlue;
  }
}
