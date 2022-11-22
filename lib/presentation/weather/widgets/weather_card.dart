import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double? temperatureFontSize;
  final double? iconScale;

  const WeatherCard({
    Key? key,
    required this.title,
    required this.temperature,
    required this.iconCode,
    this.temperatureFontSize = 32,
    this.iconScale = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Image.network(
                  "http://openweathermap.org/img/wn/$iconCode@2x.png",
                  scale: iconScale!),
              Text(
                '$temperature°',
                style: TextStyle(
                  fontSize: temperatureFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
