part of '../google_weather_clone.dart';

final List<HourlyControl> controls = [
  HourlyControl(
    title: 'Precipitation',
    iconData: Symbols.rainy,
    type: HourlyDetailType.precipitation,
  ),
  HourlyControl(
    title: 'Wind',
    iconData: Symbols.near_me_rounded,
    type: HourlyDetailType.wind,
  ),
  HourlyControl(
    title: 'Humidity',
    iconData: Symbols.humidity_mid,
    type: HourlyDetailType.humidity,
  ),
];

class _HourlyDetails extends StatefulWidget {
  const _HourlyDetails({super.key});

  @override
  State<_HourlyDetails> createState() => _HourlyDetailsState();
}

class _HourlyDetailsState extends State<_HourlyDetails> {
  final List<HourlyDetail> hourlyDetails = [
    HourlyDetail(
      title: '0.0 mm',
      overline: 'Today\'s amount',
      type: HourlyDetailType.precipitation,
    ),
    HourlyDetail(
      title: '19',
      subtitle: 'km/h · Light',
      overline: 'Today\'s high',
      type: HourlyDetailType.wind,
    ),
    HourlyDetail(
      title: '62',
      subtitle: '%',
      overline: 'Today\'s average',
      type: HourlyDetailType.humidity,
    ),
  ];

  late HourlyControl selectedControl;

  @override
  void initState() {
    selectedControl = controls[0];
    super.initState();
  }

  void changeSelectedControl(HourlyControl control) {
    setState(() {
      selectedControl = control;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const _SectionHeader(title: 'Hourly details'),
      Card(
        margin: const EdgeInsets.symmetric(horizontal: kIndent, vertical: 0),
        shadowColor: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(kIndent),
          child: MinStartColumn(
            children: [
              _Controls(
                selectedControl: selectedControl,
                changeSelectedControl: (HourlyControl control) {
                  changeSelectedControl(control);
                },
              ),
              _QuickDetails(
                detail: hourlyDetails
                    .firstWhere((e) => e.type == selectedControl.type),
              ),
              const _HourlyData(),
            ],
          ),
        ),
      ),
    ]));
  }
}

class _Controls extends StatelessWidget {
  const _Controls({
    super.key,
    required this.selectedControl,
    required this.changeSelectedControl,
  });

  final HourlyControl selectedControl;
  final Function(HourlyControl) changeSelectedControl;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
              labelLarge: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.apply(fontSizeDelta: -2))),
      child: Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 6,
          spacing: 8,
          children: controls.map((e) {
            return FilterChip(
              avatar: Icon(
                e.iconData,
                weight: 600,
                fill: e.iconData == Symbols.rainy ? 0 : 1,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              showCheckmark: false,
              selected: e == selectedControl,
              label: Text(e.title),
              onSelected: (v) {
                if (v) {
                  changeSelectedControl(e);
                }
              },
            );
          }).toList()),
    );
  }
}

class _QuickDetails extends StatelessWidget {
  const _QuickDetails({super.key, required this.detail});

  final HourlyDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    // switch(this.type) {
    //   case HourlyDetailType.precipitation:
    //  return '';
    //
    // }

    return MinStartColumn(
      children: [
        vSpaceSmall,
        Text(detail.overline,
            style: textTheme.bodySmall?.apply(fontSizeDelta: -1)),
        // vSpaceMicro,
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(
              text: detail.title,
              style: textTheme.titleLarge?.apply(fontSizeDelta: -3),
              children: [
                if (detail.subtitle != null)
                  TextSpan(
                    text: ' ${detail.subtitle}',
                    style: textTheme.titleMedium?.apply(fontSizeDelta: -2),
                  )
              ]),
        ),
      ],
    );
  }
}

class _HourlyData extends StatelessWidget {
  const _HourlyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Placeholder(fallbackHeight: 150, color: getDisabledColor(context)),
    );
  }
}
