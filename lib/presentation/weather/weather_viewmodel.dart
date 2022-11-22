import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/services/weather/weather_service.dart';
import 'package:stacked/stacked.dart';

class WeatherViewModel extends ReactiveViewModel {
  WeatherViewModel({
    required this.weatherService,
  });

  final WeatherService weatherService;

  late final Weather weather;
  late final List<Weather> hourlyWeather;

  String query = 'Moscow';
  String lat = '';
  String lon = '';

  Future<void> init() async {
    setBusy(true);
    weather = await weatherService.fetchCurrentWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
    hourlyWeather = await weatherService.fetchHourlyWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
    setBusy(false);
    notifyListeners();
  }

  Future<void> onEntrySity(String city) async {
    setBusy(true);
    query = city;
    weather = await weatherService.fetchCurrentWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
    hourlyWeather = await weatherService.fetchHourlyWeather(
      query: query,
      lat: lat,
      lon: lon,
    );
    setBusy(false);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
