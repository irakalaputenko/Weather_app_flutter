import 'package:flutter/material.dart';
import 'package:weather_app/components/WeatherCard.dart';
import 'package:weather_app/components/WeatherDays.dart';
import 'package:weather_app/models/Weather.dart';

class MainScreenWrapper2 extends StatelessWidget {
  final Weather weather;
  final List<Weather> daylyWeather;

  const MainScreenWrapper2({Key key, this.weather, this.daylyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          weather.cityName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
            '${weather.description}'),
        Spacer(),
        WeatherCard(
          title: "Now",
          temperature: weather.temperature,
          iconCode: weather.iconCode,
          temperatureFontSize: 64,
          iconScale: 1,
        ),
        Spacer(),
        DaylyWeather(daylyWeather: this.daylyWeather)
      ]),
    );
  }
}