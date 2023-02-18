import 'package:flutter/material.dart';
import 'package:pet_projects/presentation/weather/widgets/weather_card.dart';

import '../../../data/models/weather/weather.dart';

const _heightScreen = 200.0;

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key? key, required this.hourlyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _heightScreen,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, i) {
          final weather = hourlyWeather[i];
          final hour = weather.time.hour;
          final minute = weather.time.minute;
          return WeatherCard(
            title: '$hour:${minute}0',
            temperature: weather.temperature.toInt(),
            iconCode: weather.iconCode,
            temperatureFontSize: 20,
          );
        },
      ),
    );
  }
}
