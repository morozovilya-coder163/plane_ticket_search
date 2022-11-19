// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      cityName: json['cityName'] as String,
      temperature: json['temperature'] as int,
      iconCode: json['iconCode'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'temperature': instance.temperature,
      'iconCode': instance.iconCode,
      'description': instance.description,
      'time': instance.time.toIso8601String(),
    };
