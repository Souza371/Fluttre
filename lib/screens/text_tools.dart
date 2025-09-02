import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';


class TextToolsScreen extends StatefulWidget {
  const TextToolsScreen({super.key});

  @override
  State<TextToolsScreen> createState() => _TextToolsScreenState();
}

class _TextToolsScreenState extends State<TextToolsScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _result = '';
  String _selectedTool = 'Maiúsculas';
  final List<String> _tools = [
    'Maiúsculas', 'Minúsculas', 'Contar Caracteres', 'Contar Palavras', 'Inverter Texto'
  ];

  void _processText() {
    String text = _inputController.text;
    switch (_selectedTool) {
      case 'Maiúsculas':
        _result = text.toUpperCase();
        break;
      case 'Minúsculas':
        _result = text.toLowerCase();
        break;
      case 'Contar Caracteres':
        _result = 'Caracteres: ${text.length}';
        break;
      case 'Contar Palavras':
        _result = 'Palavras: ${text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length}';
        break;
      case 'Inverter Texto':
        _result = text.split('').reversed.join();
        break;
      default:
        _result = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ferramentas de Texto'),
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
              DropdownButton<String>(
                value: _selectedTool,
                items: _tools.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTool = newValue!;
                    _processText();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                  labelText: 'Digite o texto',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) => _processText(),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _result.isEmpty ? 'Resultado' : _result,
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
