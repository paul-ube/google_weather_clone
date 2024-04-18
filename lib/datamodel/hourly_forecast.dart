import 'package:flutter/material.dart';

class HourlyForecast {
  final String temperature;
  final IconData iconData;
  final String time;

  HourlyForecast({required this.temperature, required this.iconData, required this.time});

  String get tempWithDegree => '$temperature°';
}