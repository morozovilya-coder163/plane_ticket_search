import 'dart:convert';

import 'package:pet_projects/data/models/weather/coordinates.dart';
import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';

import 'package:http/http.dart' as http;

final weatherBaseUrl = Uri.parse('http://api.openweathermap.org/');
final coorfinatesBaseUrl = Uri.parse('http://api.openweathermap.org/');

class WeatherRepositoryImpl extends WeatherRepository {
  final String _apiKey = "076b50107cb0a3683c8f96b54525121c";
  final _pathWeather = '/data/2.5/forecast';
  final _pathCoordinates = '/geo/1.0/direct';

  @override
  Future<Weather> fetchCurrentWeather({
    required String lat,
    required String lon,
  }) async {
    var url = weatherBaseUrl.replace(
      path: _pathWeather,
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': _apiKey,
      },
    );

    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final weatherInJsonFormat = jsonData['list'][0];
      final cityJson = jsonData['city']['name'];

      return Weather.fromJson(weatherInJsonFormat, cityJson);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<List<Weather>> fetchHourlyWeather({
    required String lat,
    required String lon,
  }) async {
    var url = weatherBaseUrl.replace(
      path: _pathWeather,
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final itemsInJsonFormat = jsonData['list'];
      final cityInJsonFormat = jsonData['city']['name'];

      final List<Weather> data = (itemsInJsonFormat as List<dynamic>).map(
        (item) {
          return Weather.fromJson(
            item,
            cityInJsonFormat,
          );
        },
      ).toList();

      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<Coordinates> fetchCoordinates({required String city}) async {
    String? lat;
    String? lon;

    var url = coorfinatesBaseUrl.replace(
      path: _pathCoordinates,
      queryParameters: {
        'q': city,
        'limit': '5',
        'appid': _apiKey,
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);

      lat = (res.first['lat'] as double).toStringAsFixed(2);
      lon = (res.first['lon'] as double).toStringAsFixed(2);

      return Coordinates(
        lat: lat,
        lon: lon,
      );
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
