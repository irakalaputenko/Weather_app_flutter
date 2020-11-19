import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather.dart';

class WeatherService {
  static String _apiKey = "e42b2fb5ba0b4288fe5d0b09d2bbd471";

  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<List<Weather>> fetchHourlyWeather({String query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
        return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<List<Weather>> fetchDaylyWeather({String query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast/daily?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&cnt=16&units=metric';
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
        return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}