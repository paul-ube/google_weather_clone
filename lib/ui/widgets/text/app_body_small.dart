import 'package:flutter/material.dart';

class AppBodySmall extends StatelessWidget {
  const AppBodySmall(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.bodySmall?.apply(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSizeDelta: -2));
  }
}
