import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  String? q = "london";

  final String host = "community-open-weather-map.p.rapidapi.com";
  final String apiKey = "c0960bc796mshcf90c309c36b93ep155b7ajsnecd96b973dee";
  final String hostName = "X-RapidAPI-Host";
  final String apiName = "X-RapidAPI-Key";
  final baseURL = "https://community-open-weather-map.p.rapidapi.com";
  // WeatherService({this.q});

  Future<Map<String, dynamic>> getCurrentData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/weather?q=$q",
        ),
        headers: {
          hostName: host,
          apiName: apiKey,
        },
      );

      final data = jsonDecode(response.body);
      // print(data);

      return data;
    } catch (e) {
      // ignore: avoid_print
      print("Error is $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getNextForecast() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/forecast?q=$q",
        ),
        headers: {
          hostName: host,
          apiName: apiKey,
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

  Future<List<Map<String, dynamic>>> getDailyForecast() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/forecast/daily?q=$q",
        ),
        headers: {
          hostName: host,
          apiName: apiKey,
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
