import 'package:flutter/material.dart';
import 'package:pet_projects/presentation/weather/widgets/weather_card.dart';

import '../../../data/models/weather/weather.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key? key, required this.hourlyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, i) {
          return WeatherCard(
            title:
                '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
            temperature: hourlyWeather[i].temperature.toInt(),
            iconCode: hourlyWeather[i].iconCode,
            temperatureFontSize: 20,
          );
        },
      ),
    );
  }
}
