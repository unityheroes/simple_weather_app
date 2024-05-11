import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:simple_weather_app/models/weather_model.dart';

//https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/cairo?unitGroup=us&key=$apikey&contentType=json
class WeatherService {
  final String apiKey = 'RLVBJSEC8EMTYBG3EKNXHS4D6';
  final String domainApi = "https://weather.visualcrossing.com";
  final String cityQuery = "cairo";
  final Dio dio = Dio();

  Future<WeatherModel> getCurrentweather({required cityQuery}) async {
    try {
      Response response = await dio.get(
          "$domainApi/VisualCrossingWebServices/rest/services/timeline/$cityQuery?unitGroup=us&key=$apiKey&contentType=json");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response != null
          ? e.response.toString()
          : "Oops, there was an error";

      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error");
    }
  }
}
