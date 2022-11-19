import 'package:pet_projects/data/models/weather/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchCurrentWeather({required dynamic query, required String lat, required String lon});
  Future<List<Weather>> fetchHourlyWeather({required String query, required String lat, required String lon});
}
