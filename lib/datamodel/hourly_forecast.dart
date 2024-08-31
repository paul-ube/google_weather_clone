import 'package:flutter/material.dart';

class HourlyForecast {
  final String temperature;
  final String precipitation;
  final String humidity;
  final IconData iconData;
  final String time;

  HourlyForecast(
      {required this.temperature,
      required this.precipitation,
      required this.humidity,
      required this.iconData,
      required this.time});

  String get tempWithDegree => '$temperature°';
}
