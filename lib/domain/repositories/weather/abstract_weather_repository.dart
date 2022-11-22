import 'package:pet_projects/data/models/weather/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchCurrentWeather({dynamic query, String? lat = '', String? lon = ''});
  Future<List<Weather>> fetchHourlyWeather({String query, String? lat = '', String? lon = ''});
}
