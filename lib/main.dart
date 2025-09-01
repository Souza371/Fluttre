import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/unit_converter.dart';
import 'screens/measurement_converter.dart';
import 'screens/text_tools.dart';
import 'screens/calculator.dart';
import 'screens/password_generator.dart';
import 'screens/currency_converter.dart';
import 'screens/date_time_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vicente Tools',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/unit_converter': (context) => UnitConverterScreen(),
        '/measurement_converter': (context) => MeasurementConverterScreen(),
        '/text_tools': (context) => TextToolsScreen(),
        '/calculator': (context) => CalculatorScreen(),
        '/password_generator': (context) => PasswordGeneratorScreen(),
        '/currency_converter': (context) => CurrencyConverterScreen(),
        '/date_time_tools': (context) => DateTimeToolsScreen(),
      },
    );
  }
}
