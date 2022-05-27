import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String hostKey = "community-open-weather-map.p.rapidapi.com";
  final String apiKey = "148d48a70fmsh276705c95335d87p1b884cjsn5d365f301f60";
  final String host = "X-RapidAPI-Host";
  final String api = "X-RapidAPI-Key";
  final baseURL = "https://community-open-weather-map.p.rapidapi.com";
  // WeatherService({this.q});

  Future<Map<String, dynamic>> getCurrentData({
    required String? q,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/weather?q=$q",
        ),
        headers: {
          host: hostKey,
          api: apiKey,
        },
      );

      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      print("Error is $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getNextForecast({
    required String? q,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/forecast?q=$q",
        ),
        headers: {
          host: hostKey,
          api: apiKey,
        },
      );

      final data = jsonDecode(response.body)["list"];
      // print(data);
      final List<Map<String, dynamic>> forecastList =
          List<Map<String, dynamic>>.from(
        data.map((e) => e),
      );
      return forecastList;
    } catch (e) {
      // ignore: avoid_print
      print("Error is $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getDailyForecast({
    required String? q,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/forecast/daily?q=$q",
        ),
        headers: {
          host: hostKey,
          api: apiKey,
        },
      );

      final data = jsonDecode(response.body)["list"];
      // print(data);
      final List<Map<String, dynamic>> dailyForecastList =
          List<Map<String, dynamic>>.from(
        data.map((e) => e),
      );
      // print(dailyForecastList);
      // print("object");
      return dailyForecastList;
    } catch (e) {
      // ignore: avoid_print
      print("Error is $e");
      rethrow;
    }
  }
}
