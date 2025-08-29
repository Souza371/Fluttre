import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class PasswordGeneratorScreen extends StatelessWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gerador de Senhas'),
      body: const Center(
        child: Text('Gerador de Senhas - Em desenvolvimento'),
      ),
    );
  }
}
