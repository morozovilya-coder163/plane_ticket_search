import 'package:pet_projects/domain/repositories/weather/weather_repository.dart';
import 'package:pet_projects/domain/services/weather/weather_service.dart';

class Di {
  static final Di instance = Di._();

  late final WeatherRepositoryImpl weatherRepositoryImpl;
  late final WeatherService weatherService;

  Di._() {
    weatherRepositoryImpl = WeatherRepositoryImpl();
    weatherService = WeatherService(weatherRepository: weatherRepositoryImpl);
  }
}
