part of '../google_weather_clone.dart';

class _CurrentConditions extends StatelessWidget {
  const _CurrentConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return MultiSliver(
      children: [
        const SliverToBoxAdapter(
            child: _SectionHeader(title: 'Current conditions')),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kIndent),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2 -
                  (kIndent + kIndent / 2),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 4 / 3,
            ),
            delegate: SliverChildListDelegate([
              _CurrentConditionItem(
                title: 'Wind',
                mainData: '34',
                mainDataTrailing: ' km/h',
                detail: 'Moderate • From northwest',
                supportingIconTitle: 'N',
                supportingIcon: Stack(
                  children: [
                    const Icon(Icons.near_me_rounded,
                        color: Color(0xFFCBF0F8), size: 70),
                    if (!isDarkMode(context))
                      const Icon(
                        Icons.near_me_outlined,
                        color: Color(0xFF22A4B4),
                        size: 70,
                        weight: 100,
                      ),
                  ],
                ),
              ),
              _CurrentConditionItem(
                title: 'Humidity',
                mainData: '54',
                mainDataTrailing: '%',
                detail: 'Dew point 18°',
                supportingIconTitle: '100',
                supportingIcon: Stack(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Center(
                          child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFFDE293),
                                borderRadius: BorderRadius.circular(50)),
                            width: 30,
                            height: 60,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFCC933),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(0),
                                  bottom: Radius.circular(50),
                                ),
                              ),
                              width: 30,
                              height: 32,
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
              _CurrentConditionItem(
                title: 'UV index',
                mainData: '2',
                // mainDataTrailing: '%',
                detail: 'Low',
                supportingIconTitle: '11+',
                supportingIcon: Stack(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFD6EBC1),
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              color: const Color(0xFFA7D27B),
                              height: 9,
                              width: 50,
                            ),
                          ],
                        ),
                      )),
                    )
                  ],
                ),
                supportingIconDetail: _BodySmallText(
                  '0',
                ),
              ),
              _CurrentConditionItem(
                title: 'Pressure',
                mainData: '1,006',
                detail: 'mBar',
                supportingIconTitle: '',
                supportingIcon: Stack(
                  children: [
                    SizedBox(
                        height: 70,
                        width: 70,
                        child: Center(
                            child: Container(
                          child: const CircularIncompleteIndicator(
                            radius: 30,
                            lineWidth: 12.0,
                            percent: 0.47,
                            progressColor: Color(0xFF5FB1F8),
                            bottomExclusionPercentage: 0.2,
                            totalColor: Color(0xFFCEE4FF),
                          ),
                        )))
                  ],
                ),
                supportingIconDetail: _BodySmallText('Low   High'),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _CurrentConditionItem extends StatelessWidget {
  const _CurrentConditionItem({
    super.key,
    this.supportingIconTitle,
    required this.supportingIcon,
    required this.title,
    required this.mainData,
    this.mainDataTrailing,
    required this.detail,
    this.supportingIconDetail,
  });

  final Widget supportingIcon;
  final String? supportingIconTitle;
  final String title;
  final String mainData;
  final String? mainDataTrailing;
  final String detail;
  final Widget? supportingIconDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(m3MediumShapeRadius),
        color: colorScheme.surface,
      ),
      padding:
          const EdgeInsets.fromLTRB(kIndent, kIndent, kIndent - 4, kIndent),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _MinStartColumn(
              children: [
                Text(
                  title,
                  style: textTheme.labelSmall,
                ),
                vSpaceMedium,
                Text.rich(TextSpan(
                    text: mainData,
                    style: textTheme.headlineSmall?.apply(fontWeightDelta: 2),
                    children: [
                      TextSpan(
                        text: mainDataTrailing ?? '',
                        style: textTheme.bodySmall,
                      )
                    ])),
                vSpaceMicro,
                _BodySmallText(detail)
              ],
            ),
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (supportingIconTitle != null)
                      _BodySmallText(
                        supportingIconTitle!,
                      ),
                    supportingIcon,
                    supportingIconDetail ?? Container(),
                  ])),
        ],
      ),
    );
  }
}

class CircularIncompleteIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final double bottomExclusionPercentage;
  final Color progressColor;
  final Color totalColor;

  const CircularIncompleteIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.bottomExclusionPercentage,
    required this.progressColor,
    required this.totalColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _CircularIncompleteIndicatorPainter(
        percent: percent,
        lineWidth: lineWidth,
        bottomExclusionPercentage: bottomExclusionPercentage,
        progressColor: progressColor,
        totalColor: totalColor,
      ),
    );
  }
}

class _CircularIncompleteIndicatorPainter extends CustomPainter {
  final double percent;
  final double lineWidth;
  final double bottomExclusionPercentage;
  final Color progressColor;
  final Color totalColor;

  _CircularIncompleteIndicatorPainter({
    required this.percent,
    required this.lineWidth,
    required this.bottomExclusionPercentage,
    required this.progressColor,
    required this.totalColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    Paint totalPaint = Paint()
      ..color = totalColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double effectiveRadius =
        math.min(size.width, size.height) / 2 - lineWidth / 2;

    double totalSweepAngle = 2 * math.pi * (1 - bottomExclusionPercentage);
    double sweepAngle = totalSweepAngle * percent;

    double startAngle = math.pi / 2 + (math.pi * bottomExclusionPercentage);

    // Draw the background
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: effectiveRadius),
      startAngle,
      totalSweepAngle,
      false,
      totalPaint,
    );

    // Draw the foreground
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: effectiveRadius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
