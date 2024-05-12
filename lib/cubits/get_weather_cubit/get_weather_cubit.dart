import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:simple_weather_app/models/weather_model.dart';
import 'package:simple_weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService().getCurrentweather(cityQuery: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
      return weatherModel;
    } catch (e) {
      emit(WeatherFailureState(failureMsg: e.toString()));
    }
  }
}
