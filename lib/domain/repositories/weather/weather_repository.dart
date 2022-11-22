import 'dart:convert';

import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';

import 'package:http/http.dart' as http;

class WeatherRepositoryImpl extends WeatherRepository {
  final String _apiKey = "076b50107cb0a3683c8f96b54525121c";

  @override
  Future<Weather> fetchCurrentWeather({
    dynamic query = 'current,hourly,daily',
    String? lat = '',
    String? lon = '',
  }) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$_apiKey';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Weather.fromJson(jsonData['list'][0], jsonData['city']['name']);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<List<Weather>> fetchHourlyWeather(
      {String query = '', String lat = "", String lon = ""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data =
          (jsonData['list'] as List<dynamic>).map((item) {
        return Weather.fromJson(item, jsonData['city']['name']);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchCoordinates(
      {required String city}) async {
    String? lat;
    String? lon;
    var url =
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body) as List<dynamic>;
      lat = (res.first['lat'] as double).toStringAsFixed(2);
      lon = (res.first['lon'] as double).toStringAsFixed(2);
      return {
        'lon': lon,
        'lat': lat,
      };
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
