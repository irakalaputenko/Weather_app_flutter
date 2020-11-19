import 'package:flutter/material.dart';
import 'package:weather_app/components/WeatherCard.dart';
import 'package:weather_app/models/Weather.dart';

class DaylyWeather extends StatelessWidget {
  final List<Weather> daylyWeather;

  const DaylyWeather({Key key, this.daylyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daylyWeather.length,
            itemBuilder: (context, i) {
              return WeatherCard(
                title:
                '${daylyWeather[i].time.day}.${daylyWeather[i].time.month}',
                temperature: daylyWeather[i].temperature.toInt(),
                iconCode: daylyWeather[i].iconCode,
                temperatureFontSize: 20,
              );
            }));
  }
}