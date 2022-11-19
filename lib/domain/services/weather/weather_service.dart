import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/repositories/weather/abstract_weather_repository.dart';
import 'package:stacked/stacked.dart';

class WeatherService with ReactiveServiceMixin {
  WeatherService({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  ReactiveList<Weather> hourlyWeatherForMyLocation = ReactiveList();
  ReactiveValue<Weather?> currentWeatherForMyLocation = ReactiveValue(null);

  Future<void> init({
    queryCur,
    queryHourly,
    String latCur = '',
    String lonCur = '',
    String latHourly = '',
    String lonHourly = '',
  }) async {
    currentWeatherForMyLocation.value =
        await weatherRepository.fetchCurrentWeather(
      query: queryCur,
      lat: latCur,
      lon: lonCur,
    );
    hourlyWeatherForMyLocation.addAll(
      await weatherRepository.fetchHourlyWeather(
        query: queryHourly,
        lat: latHourly,
        lon: lonHourly,
      ),
    );
  }

  Future<Weather> fetchCurrentWeather({
    required dynamic query,
    required String lat,
    required String lon,
  }) async {
    return await weatherRepository.fetchCurrentWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
  }

  Future<List<Weather>> fetchHourlyWeather({
    required dynamic query,
    required String lat,
    required String lon,
  }) async {
    return await weatherRepository.fetchHourlyWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
  }
}
