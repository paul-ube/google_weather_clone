import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_weather_clone/datamodel/daily_forecast.dart';
import 'package:google_weather_clone/datamodel/hourly_forecast.dart';
import 'package:google_weather_clone/ui/common/ui_helpers.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'dart:math' as math;

part 'widgets/_hourly_forecast.dart';

part 'widgets/_daily_forecast.dart';

part 'widgets/_current_conditions.dart';

part 'widgets/_sunrise_and_sunset.dart';

part 'widgets/_now.dart';

List _hourlyForecastDetails = <HourlyForecast>[
  HourlyForecast(temperature: '28', iconData: Icons.thunderstorm, time: 'Now'),
  HourlyForecast(temperature: '28', iconData: Icons.thunderstorm, time: '1 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '2 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '3 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '4 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '5 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '6 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '7 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '8 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '9 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '1 0PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '11 PM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '12 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '1 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '2 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '3 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '4 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.nights_stay, time: '5 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '6 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.sunny, time: '7 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.cloud, time: '8 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.cloud, time: '9 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.cloud, time: '10 AM'),
  HourlyForecast(temperature: '28', iconData: Icons.cloud, time: '11 AM'),
  HourlyForecast(
      temperature: '28', iconData: Icons.cloudy_snowing, time: '12 PM'),
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
              title: SearchAnchor.bar(
                barElevation: const MaterialStatePropertyAll(1),
                barPadding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(16, 0, 12, 0)),
                barLeading: const Icon(Icons.location_on_outlined),
                barHintText: 'Fujairah',
                barHintStyle: MaterialStatePropertyAll(textTheme.titleLarge),
                barTrailing: [
                  CircleAvatar(
                    backgroundColor: colorScheme.primaryContainer,
                    foregroundColor: colorScheme.onPrimaryContainer,
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
            const _Now(),
            const _HourlyForecast(),
            const _TenDayForecast(),
            const _CurrentConditions(),
            const _SunriseAndSunset(),
          ],
        ));
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

class _MinStartColumn extends StatelessWidget {
  const _MinStartColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class _BodySmallText extends StatelessWidget {
  const _BodySmallText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.bodySmall?.apply(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSizeDelta: -2));
  }
}
