part of '../google_weather_clone.dart';

class _SunriseAndSunset extends StatelessWidget {
  const _SunriseAndSunset({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: kIndent,
          right: kIndent,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(kIndent),
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
                        'Sunrise & sunset',
                        style: textTheme.labelSmall,
                      ),
                      vSpaceSmall,
                      _BodySmallText(
                        'Sunrise',
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: _MinStartColumn(
                    children: [
                      SunriseSunsetGraph(),
                      vSpaceSmall,
                      _BodySmallText(
                        'Sunrise',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SunriseSunsetGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: CustomPaint(
        painter: SunriseSunsetPainter(),
      ),
    );
  }
}

class SunriseSunsetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    Path sunrisePath = Path();
    Path sunsetPath = Path();

    double graphHeight = size.height;
    double graphWidth = size.width;

    double curveControlDistance = graphHeight * 0.15;
    double sunriseHeight = graphHeight * 0.3;
    double sunsetHeight = graphHeight * 0.8;

    double sunriseWidth = graphWidth * 0.2;
    double sunsetWidth = graphWidth * 0.8;

    sunrisePath.moveTo(0, sunriseHeight);
    sunrisePath.quadraticBezierTo(
      sunriseWidth / 2,
      sunriseHeight - curveControlDistance,
      sunriseWidth,
      sunriseHeight,
    );

    sunsetPath.moveTo(sunriseWidth, sunriseHeight);
    sunsetPath.quadraticBezierTo(
      sunsetWidth / 2,
      sunsetHeight + curveControlDistance,
      sunsetWidth,
      sunsetHeight,
    );

    canvas.drawPath(sunrisePath, linePaint);
    canvas.drawPath(sunsetPath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
