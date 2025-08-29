import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Swiss Army Knife'),
      body: const Center(
        child: Text('Página inicial - Em desenvolvimento'),
      ),
    );
  }
}
