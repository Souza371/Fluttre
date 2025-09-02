import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';


import 'dart:math';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  State<PasswordGeneratorScreen> createState() => _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  int _length = 12;
  bool _useUpper = true;
  bool _useLower = true;
  bool _useNumbers = true;
  bool _useSymbols = true;
  String _password = '';

  void _generatePassword() {
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()-_=+[]{};:,.<>?';
    String chars = '';
    if (_useUpper) chars += upper;
    if (_useLower) chars += lower;
    if (_useNumbers) chars += numbers;
    if (_useSymbols) chars += symbols;
    if (chars.isEmpty) {
      setState(() { _password = 'Selecione pelo menos um tipo.'; });
      return;
    }
    var rand = Random.secure();
    _password = List.generate(_length, (i) => chars[rand.nextInt(chars.length)]).join();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gerador de Senhas'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43EA7F), Color(0xFF1B5E20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Tamanho:', style: TextStyle(color: Colors.white)),
                  Expanded(
                    child: Slider(
                      value: _length.toDouble(),
                      min: 6,
                      max: 32,
                      divisions: 26,
                      label: _length.toString(),
                      onChanged: (value) {
                        setState(() { _length = value.toInt(); });
                      },
                    ),
                  ),
                  Text('$_length', style: const TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: _useUpper, onChanged: (v) { setState(() { _useUpper = v!; }); }),
                  const Text('Maiúsculas', style: TextStyle(color: Colors.white)),
                  Checkbox(value: _useLower, onChanged: (v) { setState(() { _useLower = v!; }); }),
                  const Text('Minúsculas', style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: _useNumbers, onChanged: (v) { setState(() { _useNumbers = v!; }); }),
                  const Text('Números', style: TextStyle(color: Colors.white)),
                  Checkbox(value: _useSymbols, onChanged: (v) { setState(() { _useSymbols = v!; }); }),
                  const Text('Símbolos', style: TextStyle(color: Colors.white)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _generatePassword,
                child: const Text('Gerar Senha', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SelectableText(
                  _password.isEmpty ? 'Senha gerada aparecerá aqui' : _password,
                  style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
