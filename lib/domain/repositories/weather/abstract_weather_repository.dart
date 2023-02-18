import 'package:pet_projects/data/models/weather/weather.dart';

import '../../../data/models/weather/coordinates.dart';

abstract class WeatherRepository {
  Future<Weather> fetchCurrentWeather({
    required String lat,
    required String lon,
  });

  Future<List<Weather>> fetchHourlyWeather({
    required String lat,
    required String lon,
  });

  Future<Coordinates> fetchCoordinates({
    required String city,
  });
}
