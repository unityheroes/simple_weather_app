import 'package:simple_weather_app/models/weather_model.dart';

abstract class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String failureMsg;

  WeatherFailureState({required this.failureMsg});
}
