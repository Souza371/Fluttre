import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class TextToolsScreen extends StatelessWidget {
  const TextToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ferramentas de Texto'),
      body: const Center(
        child: Text('Ferramentas de Texto - Em desenvolvimento'),
      ),
    );
  }
}
