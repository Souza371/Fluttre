import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversor de Moedas'),
      body: const Center(
        child: Text('Conversor de Moedas - Em desenvolvimento'),
      ),
    );
  }
}
