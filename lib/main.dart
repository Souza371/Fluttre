import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/unit_converter.dart';
import 'screens/measurement_converter.dart';
import 'screens/text_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Knife',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/unit_converter': (context) => UnitConverterScreen(),
        '/measurement_converter': (context) => MeasurementConverterScreen(),
        '/text_tools': (context) => TextToolsScreen(),
      },
    );
  }
}
