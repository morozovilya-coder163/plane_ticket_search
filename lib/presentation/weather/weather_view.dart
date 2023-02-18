import 'package:flutter/material.dart';

import 'package:pet_projects/di/container.dart';
import 'package:pet_projects/presentation/weather/weather_viewmodel.dart';
import 'package:pet_projects/presentation/weather/widgets/hourly_weather.dart';
import 'package:pet_projects/presentation/weather/widgets/my_search_delegate.dart';
import 'package:pet_projects/presentation/weather/widgets/weather_card.dart';
import 'package:stacked/stacked.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherViewModel>.reactive(
      viewModelBuilder: () => WeatherViewModel(
        weatherService: Di.instance.weatherService,
      ),
      onModelReady: (m) => m.init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                      (query) {
                        model.onEntrySity(query);
                      },
                    ),
                  );
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    model.weather!.cityName,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(model.weather!.description),
                  const Spacer(),
                  WeatherCard(
                    title: "Now",
                    temperature: model.weather!.temperature,
                    iconCode: model.weather!.iconCode,
                    temperatureFontSize: 64,
                    iconScale: 1,
                  ),
                  const Spacer(),
                  HourlyWeather(hourlyWeather: model.hourlyWeather!)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
