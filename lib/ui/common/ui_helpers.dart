import 'package:flutter/material.dart';

const double kIndent = 16;

const Widget vSpaceMicro = SizedBox(height: 2);
const Widget vSpaceMini = SizedBox(height: 4);
const Widget vSpaceSmall = SizedBox(height: 8);
const Widget vSpaceMedium = SizedBox(height: 16);
const Widget vSpaceLarge = SizedBox(height: 24);

const Widget hSpaceMicro = SizedBox(width: 2);
const Widget hSpaceMini = SizedBox(width: 4);
const Widget hSpaceSmall = SizedBox(width: 8);
const Widget hSpaceMedium = SizedBox(width: 16);
const Widget hSpaceLarge = SizedBox(width: 24);

const double m3SmallShapeRadius = 8;
const double m3MediumShapeRadius = 12;
const double m3LargeShapeRadius = 16;
const double m3ExtraLargeRadius = 28;
const double m3ToolbarHeight = 64;

bool isDarkMode(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}

Color getSurfaceTint(BuildContext context, {double elevation = 1}) {
  return ElevationOverlay.applySurfaceTint(
      Theme.of(context).colorScheme.surface,
      Theme.of(context).colorScheme.surfaceTint,
      elevation);
}
