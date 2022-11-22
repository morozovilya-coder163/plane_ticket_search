import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';
import 'package:stacked/stacked.dart';

class WeatherService with ReactiveServiceMixin {
  WeatherService({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Weather> fetchCurrentWeather({
    dynamic query,
    String? lat,
    String? lon,
  }) async {
    return await weatherRepository.fetchCurrentWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
  }

  Future<List<Weather>> fetchHourlyWeather({
    dynamic query,
    required String lat,
    required String lon,
  }) async {
    return await weatherRepository.fetchHourlyWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
  }

  Future<Map<String, dynamic>> fetchCoordinates({required String city}) async {
    return await weatherRepository.fetchCoordinates(city: city);
  }
}
