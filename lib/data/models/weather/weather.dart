import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String cityName;
  final int temperature;
  final String iconCode;
  final String description;
  final DateTime time;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.iconCode,
    required this.description,
    required this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
