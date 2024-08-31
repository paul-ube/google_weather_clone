import 'package:flutter/material.dart';
import 'package:google_weather_clone/datamodel/hourly_detail.dart';

class HourlyControl {
  final String title;
  final IconData iconData;
  final HourlyDetailType type;

  HourlyControl({
    required this.title,
    required this.iconData,
    required this.type,
  });
}
