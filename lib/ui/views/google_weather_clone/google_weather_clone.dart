import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_weather_clone/datamodel/daily_forecast.dart';
import 'package:google_weather_clone/datamodel/hourly_control.dart';
import 'package:google_weather_clone/datamodel/hourly_detail.dart';
import 'package:google_weather_clone/datamodel/hourly_forecast.dart';
import 'package:google_weather_clone/ui/common/ui_helpers.dart';
import 'package:google_weather_clone/ui/widgets/atoms/horizontal_padding.dart';
import 'package:google_weather_clone/ui/widgets/atoms/min_start_column.dart';
import 'package:google_weather_clone/ui/widgets/text/app_body_small.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sliver_tools/sliver_tools.dart';

part '../google_weather_clone/widgets/_now.dart';

part '../google_weather_clone/widgets/_daily_forecast.dart';

part '../google_weather_clone/widgets/_hourly_forecast.dart';

part '../google_weather_clone/widgets/_current_conditions.dart';

part '../google_weather_clone/widgets/_sunset_and_sunrise.dart';

part '../google_weather_clone/widgets/_hourly_details.dart';

List _hourlyForecastDetails = <HourlyForecast>[
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.thunderstorm,
      time: 'Now'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.thunderstorm,
      time: '1 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '2 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '3 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '4 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '5 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '6 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '7 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '8 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '9 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '1 0PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '11 PM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '12 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '1 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '2 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '3 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '4 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.nights_stay,
      time: '5 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '6 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.sunny,
      time: '7 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.cloud,
      time: '8 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.cloud,
      time: '9 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.cloud,
      time: '10 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.cloud,
      time: '11 AM'),
  HourlyForecast(
      temperature: '28',
      precipitation: '0%',
      humidity: '55',
      iconData: Icons.cloudy_snowing,
      time: '12 PM'),
];

List _tenDayForecast = <DailyForecast>[
  DailyForecast(
      day: 'Today', iconData: Icons.wb_cloudy, maxTemp: '28', minTemp: '23'),
  DailyForecast(
      day: 'Thursday', iconData: Icons.sunny, maxTemp: '29', minTemp: '23'),
  DailyForecast(
      day: 'Friday', iconData: Icons.sunny, maxTemp: '29', minTemp: '24'),
  DailyForecast(
      day: 'Saturday', iconData: Icons.sunny, maxTemp: '29', minTemp: '24'),
  DailyForecast(
      day: 'Sunday', iconData: Icons.sunny, maxTemp: '29', minTemp: '26'),
  DailyForecast(
      day: 'Monday', iconData: Icons.wb_cloudy, maxTemp: '31', minTemp: '26'),
  DailyForecast(
      day: 'Tuesday', iconData: Icons.wb_cloudy, maxTemp: '32', minTemp: '26'),
  DailyForecast(
      day: 'Wednesday', iconData: Icons.sunny, maxTemp: '31', minTemp: '25'),
  DailyForecast(
      day: 'Thursday', iconData: Icons.sunny, maxTemp: '31', minTemp: '26'),
  DailyForecast(
      day: 'Friday', iconData: Icons.sunny, maxTemp: '32', minTemp: '27'),
];

class GoogleWeatherClone extends StatefulWidget {
  const GoogleWeatherClone({super.key});

  @override
  State<GoogleWeatherClone> createState() => _GoogleWeatherCloneState();
}

class _GoogleWeatherCloneState extends State<GoogleWeatherClone> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryContainer,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            clipBehavior: Clip.none,
            shape: const StadiumBorder(),
            scrolledUnderElevation: 0.0,
            titleSpacing: 16,
            backgroundColor: Colors.transparent,
            floating: false,
            collapsedHeight: m3ToolbarHeight,
            title: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SearchAnchor.bar(
                barElevation: const WidgetStatePropertyAll(0),
                barPadding: const WidgetStatePropertyAll(
                    EdgeInsets.fromLTRB(16, 0, 12, 0)),
                barLeading: const Icon(Icons.location_on_outlined),
                barHintText: 'Fujairah',
                barHintStyle: WidgetStatePropertyAll(textTheme.titleLarge),
                barBackgroundColor:
                    WidgetStatePropertyAll(colorScheme.surfaceContainerLowest),
                barTrailing: [
                  CircleAvatar(
                    backgroundColor: colorScheme.primaryContainer,
                    foregroundColor: colorScheme.onPrimaryContainer,
                    radius: 16,
                    child: const Text('S'),
                  )
                ],
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<Widget>.generate(
                    5,
                    (int index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text('Initial list item $index'),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const _Now(),
          const _HourlyForecast(),
          const _TenDayForecast(),
          const _CurrentConditions(),
          const _SunsetAndSunrise(),
          _HourlyDetails(),
          const SliverToBoxAdapter(child: vSpaceLarge),
          // const _SunriseAndSunset(),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kIndent, kIndent + 4, kIndent, 10),
      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
