import 'package:pet_projects/data/models/weather/coordinates.dart';
import 'package:pet_projects/data/models/weather/weather.dart';
import 'package:pet_projects/domain/services/weather/weather_service.dart';
import 'package:stacked/stacked.dart';

class WeatherViewModel extends ReactiveViewModel {
  WeatherViewModel({
    required this.weatherService,
  });

  final WeatherService weatherService;

  Weather? weather;
  List<Weather>? hourlyWeather;

  String query = '';
  String city = 'Moscow';
  String lat = '';
  String lon = '';

  Future<void> init() async {
    setBusy(true);
    await setLatLon();
    setBusy(false);
  }

  Future<void> onEntrySity(String newCity) async {
    setBusy(true);
    city = newCity;
    await setLatLon();
    setBusy(false);
  }

  Future<void> setLatLon() async {
    Coordinates coordinates = await weatherService.fetchCoordinates(city: city);

    lat = coordinates.lat;
    lon = coordinates.lon;

    weather = await weatherService.fetchCurrentWeather(
      lat: lat,
      lon: lon,
    );
    hourlyWeather = await weatherService.fetchHourlyWeather(
      lat: lat,
      lon: lon,
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
