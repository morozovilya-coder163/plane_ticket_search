import 'dart:convert';

import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';

import 'package:http/http.dart' as http;

class WeatherRepositoryImpl extends WeatherRepository {
  final String _apiKey = "Здесь должен быть ваш токен";

  @override
  Future<Weather> fetchCurrentWeather({required dynamic query, required String lat, required String lon,}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri(path: url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<List<Weather>> fetchHourlyWeather({required String query, required String lat, required String lon}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri(path: url));

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