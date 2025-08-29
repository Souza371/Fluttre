import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class MeasurementConverterScreen extends StatelessWidget {
  const MeasurementConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversor de Medidas'),
      body: const Center(
        child: Text('Conversor de Medidas - Em desenvolvimento'),
      ),
    );
  }
}
