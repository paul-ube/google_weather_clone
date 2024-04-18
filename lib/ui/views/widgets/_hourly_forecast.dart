part of '../google_weather_clone.dart';

class _HourlyForecast extends StatelessWidget {
  const _HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
          const _SectionHeader(title: 'Hourly forecast'),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: kIndent, vertical: 0),
            shadowColor: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: kIndent, bottom: kIndent),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      _hourlyForecastDetails.length,
                          (index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 12.0 : 0),
                        child: _HourlyForecastWidget(
                          forecast: _hourlyForecastDetails[index],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ]));
  }
}

class _HourlyForecastWidget extends StatelessWidget {
  final HourlyForecast forecast;

  const _HourlyForecastWidget({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    late final Color iconColor;

    if (forecast.iconData.toString().contains('F057')) {
      iconColor = Colors.yellow.shade600;
    } else {
      iconColor = Colors.blue.shade600;
    }
    return SizedBox(
      width: 64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(forecast.tempWithDegree,
              style: Theme.of(context).textTheme.labelLarge),
          vSpaceMedium,
          Icon(
            forecast.iconData,
            size: 30,
            color: iconColor,
          ),
          vSpaceMini,
          Text(
            forecast.time,
            style: Theme.of(context).textTheme.bodySmall?.apply(
              fontSizeDelta: -1,
              wordSpacingDelta: -2,
            ),
          )
        ],
      ),
    );
  }
}