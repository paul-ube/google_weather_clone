import 'package:flutter/material.dart';

class DailyForecast {
  final String day;
  final IconData iconData;
  final String maxTemp; final String minTemp;

  DailyForecast({required this.day, required this.iconData, required this.maxTemp, required this.minTemp});

  String get maxMinTemp => '$maxTemp°/$minTemp°';

  String get maxTempWithDegree => '$maxTemp°';

  String get minTempWithDegree => '$minTemp°';
}