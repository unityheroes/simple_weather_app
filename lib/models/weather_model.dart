class WeatherModel {
  final String cityName;

  final String icon;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String conditions;
  final String description;
  final int datetimeEpoch;

  String formattedDate() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(datetimeEpoch * 1000);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  String convertToFahrenheit({required String tmpvalue}) {
    double fahrenheit = double.tryParse(tmpvalue) ?? 0;
    int celsius = ((fahrenheit - 32) * 5 / 9).round();
    return celsius.toString();
  }

  WeatherModel(
      {required this.cityName,
      required this.datetimeEpoch,
      required this.icon,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.conditions,
      required this.description});

  factory WeatherModel.fromJson(json) {
    final firstDay = json['days'][0];

    return WeatherModel(
      cityName: json['resolvedAddress'],
      datetimeEpoch: firstDay['datetimeEpoch'],
      icon: firstDay['icon'],
      temp: firstDay['temp'].toString(),
      maxTemp: firstDay['tempmax'].toString(),
      minTemp: firstDay['tempmin'].toString(),
      description: firstDay['description'],
      conditions: firstDay['conditions'], // if i add image from assets
    );
  }
}
