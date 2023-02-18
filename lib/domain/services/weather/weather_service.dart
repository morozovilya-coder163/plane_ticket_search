import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';
import 'package:stacked/stacked.dart';

import '../../../data/models/weather/coordinates.dart';

class WeatherService with ReactiveServiceMixin {
  WeatherService({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Weather> fetchCurrentWeather({
    required String lat,
    required String lon,
  }) async {
    return await weatherRepository.fetchCurrentWeather(
      lat: lat,
      lon: lon,
    );
  }

  Future<List<Weather>> fetchHourlyWeather({
    required String lat,
    required String lon,
  }) async {
    return await weatherRepository.fetchHourlyWeather(
      lat: lat,
      lon: lon,
    );
  }

  Future<Coordinates> fetchCoordinates({required String city}) async {
    return await weatherRepository.fetchCoordinates(city: city);
  }
}
