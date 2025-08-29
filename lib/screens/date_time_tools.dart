import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class DateTimeToolsScreen extends StatelessWidget {
  const DateTimeToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ferramentas de Data e Hora'),
      body: const Center(
        child: Text('Ferramentas de Data e Hora - Em desenvolvimento'),
      ),
    );
  }
}
