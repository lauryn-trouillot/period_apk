import 'package:flutter/material.dart';
import 'screens/menstrual_tracker_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'), // Application en français
      ],
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MenstrualTrackerScreen(),
    );
  }
}
