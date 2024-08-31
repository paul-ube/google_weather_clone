part of '../google_weather_clone.dart';

class _SunsetAndSunrise extends StatelessWidget {
  const _SunsetAndSunrise({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(kIndent, 12, kIndent, 0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(m3MediumShapeRadius),
            color: colorScheme.surface,
          ),
          padding:
              const EdgeInsets.fromLTRB(kIndent, kIndent, kIndent, kIndent),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: MinStartColumn(
                  children: [
                    Text(
                      'Sunrise & sunset',
                      style: textTheme.labelSmall,
                    ),
                    vSpaceSmall,
                    const Expanded(
                      child: _SunriseSunset(
                        overline: 'Sunrise',
                        title: '5:55',
                        subtitle: 'AM',
                      ),
                    ),
                    const _SunriseSunset(
                      overline: 'Sunset',
                      title: '6:34',
                      subtitle: 'PM',
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Placeholder(
                        fallbackHeight: 80, color: getDisabledColor(context)),
                    vSpaceSmall,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _DawnDusk(title: 'Dawn', subtitle: '5:32 AM'),
                        _DawnDusk(
                          title: 'Dusk',
                          subtitle: '6:57 PM',
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SunriseSunset extends StatelessWidget {
  const _SunriseSunset(
      {super.key,
      required this.overline,
      required this.title,
      required this.subtitle});

  final String overline, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return MinStartColumn(children: [
      AppBodySmall(overline),
      RichText(
        textScaler: MediaQuery.of(context).textScaler,
        text: TextSpan(
            text: title,
            style: textTheme.titleLarge?.apply(fontSizeDelta: -3),
            children: [
              if (subtitle != null)
                TextSpan(
                  text: ' $subtitle',
                  style: textTheme.titleMedium?.apply(fontSizeDelta: -2),
                )
            ]),
      ),
    ]);
  }
}

class _DawnDusk extends StatelessWidget {
  const _DawnDusk({
    super.key,
    required this.title,
    required this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final smallText = Theme.of(context).textTheme.bodySmall?.apply(
          fontSizeDelta: -3,
          fontWeightDelta: 1,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: smallText),
        Text(subtitle, style: smallText),
      ],
    );
  }
}
