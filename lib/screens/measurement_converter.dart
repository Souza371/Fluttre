import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';


class MeasurementConverterScreen extends StatefulWidget {
  const MeasurementConverterScreen({super.key});

  @override
  State<MeasurementConverterScreen> createState() => _MeasurementConverterScreenState();
}

class _MeasurementConverterScreenState extends State<MeasurementConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _fromUnit = 'Metros';
  String _toUnit = 'Quilômetros';
  String _result = '';

  final List<String> _units = [
    'Metros', 'Quilômetros', 'Centímetros', 'Polegadas', 'Pés'
  ];

  void _convert() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = '';
      });
      return;
    }
    try {
      double value = double.parse(_inputController.text);
      double resultValue = value;
      // Conversões
      if (_fromUnit == _toUnit) {
        resultValue = value;
      } else if (_fromUnit == 'Metros' && _toUnit == 'Quilômetros') {
        resultValue = value / 1000;
      } else if (_fromUnit == 'Quilômetros' && _toUnit == 'Metros') {
        resultValue = value * 1000;
      } else if (_fromUnit == 'Metros' && _toUnit == 'Centímetros') {
        resultValue = value * 100;
      } else if (_fromUnit == 'Centímetros' && _toUnit == 'Metros') {
        resultValue = value / 100;
      } else if (_fromUnit == 'Metros' && _toUnit == 'Polegadas') {
        resultValue = value * 39.3701;
      } else if (_fromUnit == 'Polegadas' && _toUnit == 'Metros') {
        resultValue = value / 39.3701;
      } else if (_fromUnit == 'Metros' && _toUnit == 'Pés') {
        resultValue = value * 3.28084;
      } else if (_fromUnit == 'Pés' && _toUnit == 'Metros') {
        resultValue = value / 3.28084;
      } else if (_fromUnit == 'Centímetros' && _toUnit == 'Polegadas') {
        resultValue = value / 2.54;
      } else if (_fromUnit == 'Polegadas' && _toUnit == 'Centímetros') {
        resultValue = value * 2.54;
      } else if (_fromUnit == 'Centímetros' && _toUnit == 'Pés') {
        resultValue = value / 30.48;
      } else if (_fromUnit == 'Pés' && _toUnit == 'Centímetros') {
        resultValue = value * 30.48;
      } else if (_fromUnit == 'Quilômetros' && _toUnit == 'Centímetros') {
        resultValue = value * 100000;
      } else if (_fromUnit == 'Centímetros' && _toUnit == 'Quilômetros') {
        resultValue = value / 100000;
      } else if (_fromUnit == 'Quilômetros' && _toUnit == 'Polegadas') {
        resultValue = value * 39370.1;
      } else if (_fromUnit == 'Polegadas' && _toUnit == 'Quilômetros') {
        resultValue = value / 39370.1;
      } else if (_fromUnit == 'Quilômetros' && _toUnit == 'Pés') {
        resultValue = value * 3280.84;
      } else if (_fromUnit == 'Pés' && _toUnit == 'Quilômetros') {
        resultValue = value / 3280.84;
      }
      setState(() {
        _result = resultValue.toStringAsFixed(4);
      });
    } catch (e) {
      setState(() {
        _result = 'Entrada inválida';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _inputController.addListener(_convert);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversor de Medidas'),
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
                  Expanded(
                    child: DropdownButton<String>(
                      value: _fromUnit,
                      items: _units.map((String value) {
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
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      value: _toUnit,
                      items: _units.map((String value) {
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
              const SizedBox(height: 20),
              TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  border: const OutlineInputBorder(),
                  suffixText: _fromUnit,
                  filled: true,
                  fillColor: Colors.white,
                ),
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
                  _result.isEmpty ? 'Resultado' : '$_result $_toUnit',
                  style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
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
