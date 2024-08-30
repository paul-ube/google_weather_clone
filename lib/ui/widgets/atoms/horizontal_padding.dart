import 'package:flutter/material.dart';
import 'package:google_weather_clone/ui/common/ui_helpers.dart';

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIndent),
      child: child,
    );
  }
}
