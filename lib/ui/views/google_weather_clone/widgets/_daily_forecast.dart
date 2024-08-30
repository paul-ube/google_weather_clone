part of '../google_weather_clone.dart';

class _TenDayForecast extends StatelessWidget {
  const _TenDayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
          const _SectionHeader(title: '10-day forecast'),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: kIndent),
            child: Column(
              children: List.generate(
                  _tenDayForecast.length,
                      (index) => _DailyForecastTile(
                    forecast: _tenDayForecast[index],
                    isFirst: index == 0,
                    isLast: index == _tenDayForecast.length - 1,
                  )),
            ),
          ),
        ]));
  }
}

class _DailyForecastTile extends StatelessWidget {
  const _DailyForecastTile(
      {super.key,
        required this.isFirst,
        required this.isLast,
        required this.forecast});

  final bool isFirst;
  final bool isLast;
  final DailyForecast forecast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final BorderRadius borderRadius = BorderRadius.vertical(
      top: Radius.circular(isFirst ? m3MediumShapeRadius : 4),
      bottom: Radius.circular(isLast ? m3MediumShapeRadius : 4),
    );

    final double bottomPadding = isLast ? 0 : 4;

    late final Color iconColor;

    if (forecast.iconData.toString().contains('F057')) {
      iconColor = Colors.yellow.shade600;
    } else {
      iconColor = Colors.blue.shade600;
    }

    return Container(
      margin:
      EdgeInsets.only(bottom: bottomPadding, left: kIndent, right: kIndent),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: getSurfaceTint(context, elevation: 0),
      ),
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: Text(
                forecast.day,
                style: textTheme.labelSmall,
              )),
          Flexible(
            flex: 5,
            // fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(forecast.iconData, color: iconColor),
                Text.rich(
                  TextSpan(
                    text: forecast.maxTempWithDegree,
                    style: textTheme.labelSmall,
                    children: [
                      TextSpan(
                        text: '/${forecast.minTempWithDegree}',
                        style: textTheme.labelSmall
                            ?.apply(color: colorScheme.onSurfaceVariant),
                      )
                    ],
                  ),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}