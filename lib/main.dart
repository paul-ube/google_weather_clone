import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/views/google_weather_clone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
            labelLarge: textTheme.labelLarge
                ?.apply(
                  letterSpacingDelta: 0.1,
                )
                .copyWith(wordSpacing: 0.5),
            labelSmall: textTheme.labelSmall
                ?.apply(
                  letterSpacingDelta: -0.3,
                  fontWeightDelta: 0,
                  fontSizeDelta: 1,
                )
                .copyWith(wordSpacing: 0.4),
            titleSmall: textTheme.titleSmall
                ?.apply(
                  letterSpacingDelta: 0,
                  fontWeightDelta: 0,
                )
                .copyWith(wordSpacing: 0.5),
            bodySmall: textTheme.bodySmall
                ?.apply(
                  letterSpacingDelta: -0.1,
                  fontWeightDelta: 0,
                )
                .copyWith(wordSpacing: 0.5),
          ),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(children: [
        FilledButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GoogleWeatherClone()),
          ),
          child: const Text('Go to Weather Clone'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network('https://picsum.photos/200/300'),
            const SizedBox(height: 16),
            Text('Hello', style: textTheme.titleLarge),
            const SizedBox(height: 4),
          ],
        ),
      ]),
    );
  }
}
