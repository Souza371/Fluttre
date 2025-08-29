import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedCategory = 'Temperatura';
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  String _result = '';

  final Map<String, List<String>> _categories = {
    'Temperatura': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Comprimento': ['Metros', 'Quilômetros', 'Centímetros', 'Polegadas', 'Pés'],
  };

  @override
  void initState() {
    super.initState();
    _inputController.addListener(_convert);
  }

  void _convert() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = '';
      });
      return;
    }

    try {
      double inputValue = double.parse(_inputController.text);
      double resultValue = 0;

      // Conversões de temperatura
      if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
        resultValue = (inputValue * 9 / 5) + 32;
      } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
        resultValue = (inputValue - 32) * 5 / 9;
      } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
        resultValue = inputValue + 273.15;
      } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
        resultValue = inputValue - 273.15;
      }
      // Conversões de comprimento
      else if (_fromUnit == 'Metros' && _toUnit == 'Quilômetros') {
        resultValue = inputValue / 1000;
      } else if (_fromUnit == 'Quilômetros' && _toUnit == 'Metros') {
        resultValue = inputValue * 1000;
      } else if (_fromUnit == 'Metros' && _toUnit == 'Centímetros') {
        resultValue = inputValue * 100;
      } else if (_fromUnit == 'Centímetros' && _toUnit == 'Metros') {
        resultValue = inputValue / 100;
      } else {
        resultValue = inputValue;
      }

      setState(() {
        _result = resultValue.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        _result = 'Entrada inválida';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversor de Unidades'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              items: _categories.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                  _fromUnit = _categories[newValue]!.first;
                  _toUnit = _categories[newValue]!.first;
                  _convert();
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      border: const OutlineInputBorder(),
                      suffixText: _fromUnit,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _fromUnit,
                    items: _categories[_selectedCategory]!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _fromUnit = newValue!;
                        _convert();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Icon(Icons.arrow_downward),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: _result),
                    decoration: InputDecoration(
                      labelText: 'Resultado',
                      border: const OutlineInputBorder(),
                      suffixText: _toUnit,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
                    items: _categories[_selectedCategory]!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _toUnit = newValue!;
                        _convert();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
