import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class AllFunction {
  Map<String, dynamic> currentData = {};
  List<Map<String, dynamic>> forecastData = [];
  List<Map<String, dynamic>> dailyData = [];

  static final WeatherService _weatherService = WeatherService();
  final String initCity = "lagos";

  /// gets current weather data at the moment
  Future<void> getCurrentData(q) async {
    currentData =
        await _weatherService.getCurrentData(q: q == null ? initCity : q);
    print(currentData);
  }

  /// gets data info for every three hours from the current time
  getForecastData(q) async {
    print(currentData);
    forecastData =
        await _weatherService.getNextForecast(q: q == null ? initCity : q);
  }

  /// gets data for 7 days
  getDailyData(q) async {
    dailyData =
        await _weatherService.getDailyForecast(q: q == null ? initCity : q);
  }

  ///when the user clicks on the reload button
  onReload(q) {
    Future.delayed(const Duration(seconds: 2), () {
      getCurrentData(q);
      getForecastData(q);
      getDailyData(q);
    });
  }

  /// preloads asset images
  Future<Image> loadImg(BuildContext context, String path) async {
    var image = Image.asset(path);
    await precacheImage(image.image, context);
    return image;
  }
}
