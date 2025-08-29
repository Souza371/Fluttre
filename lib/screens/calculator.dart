import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calculadora'),
      body: const Center(
        child: Text('Calculadora - Em desenvolvimento'),
      ),
    );
  }
}
