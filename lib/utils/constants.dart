import 'package:flutter/material.dart';

class Tool {
  final IconData icon;
  final String title;
  final String route;

  Tool({required this.icon, required this.title, required this.route});
}

List<Tool> toolList = [
  Tool(
    icon: Icons.swap_horiz,
    title: 'Conversor de Unidades',
    route: '/unit_converter',
  ),
  Tool(
    icon: Icons.straighten,
    title: 'Conversor de Medidas',
    route: '/measurement_converter',
  ),
  Tool(
    icon: Icons.text_fields,
    title: 'Ferramentas de Texto',
    route: '/text_tools',
  ),
  Tool(
    icon: Icons.calculate,
    title: 'Calculadora',
    route: '/calculator',
  ),
  Tool(
    icon: Icons.lock,
    title: 'Gerador de Senhas',
    route: '/password_generator',
  ),
  Tool(
    icon: Icons.currency_exchange,
    title: 'Conversor de Moedas',
    route: '/currency_converter',
  ),
  Tool(
    icon: Icons.access_time,
    title: 'Ferramentas de Data e Hora',
    route: '/date_time_tools',
  ),
];
