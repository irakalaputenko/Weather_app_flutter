import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/Weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;
  final List<Weather> daylyWeather;

  const WeatherLoadSuccess(
      {@required this.weather, @required this.hourlyWeather, @required this.daylyWeather,})
      : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}