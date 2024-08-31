
import 'hourly_forecast.dart';
enum HourlyDetailType {
  precipitation, wind, humidity
}
class HourlyDetail {
  final String title;
  final String? subtitle;
  final String overline;
  final HourlyDetailType type;

  // final List<HourlyForecast> forecast;

  HourlyDetail({
    required this.title,
    this.subtitle,
    required this.overline,
    required this.type,
    // required this.forecast,
  });
}