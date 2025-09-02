import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _calculate() {
    try {
      String exp = _expression.replaceAll('×', '*').replaceAll('÷', '/');
      _result = _eval(exp);
    } catch (e) {
      _result = 'Erro';
    }
    setState(() {});
  }

  String _eval(String exp) {
    // Simples parser para +, -, *, /
    // Não suporta parênteses ou precedência complexa
    List<String> tokens = exp.split(RegExp(r'([+\-*/])')).where((t) => t.isNotEmpty).toList();
    double total = double.tryParse(tokens[0]) ?? 0;
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double val = double.tryParse(tokens[i + 1]) ?? 0;
      if (op == '+') total += val;
      else if (op == '-') total -= val;
      else if (op == '*') total *= val;
      else if (op == '/') total /= val;
    }
    return total.toStringAsFixed(2);
  }

  Widget _buildButton(String text, {Color? color, double fontSize = 24, Function()? onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            foregroundColor: Colors.green.shade900,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(vertical: 22),
          ),
          onPressed: onTap ?? () => _numClick(text),
          child: Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calculadora'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43EA7F), Color(0xFF1B5E20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(_expression, style: const TextStyle(fontSize: 28, color: Colors.black87)),
                  const SizedBox(height: 8),
                  Text(_result, style: const TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildButton('7'),
                        _buildButton('8'),
                        _buildButton('9'),
                        _buildButton('÷', color: Colors.green.shade100),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('4'),
                        _buildButton('5'),
                        _buildButton('6'),
                        _buildButton('×', color: Colors.green.shade100),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('1'),
                        _buildButton('2'),
                        _buildButton('3'),
                        _buildButton('-', color: Colors.green.shade100),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('0'),
                        _buildButton('.', color: Colors.green.shade50),
                        _buildButton('C', color: Colors.red.shade100, onTap: _clear),
                        _buildButton('+', color: Colors.green.shade100),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('=', color: Colors.green, fontSize: 28, onTap: _calculate),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
