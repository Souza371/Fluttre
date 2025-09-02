import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';


class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _fromCurrency = 'BRL';
  String _toCurrency = 'USD';
  String _result = '';

  final Map<String, double> _rates = {
    'BRL': 1.0,
    'USD': 0.20,
    'EUR': 0.18,
    'JPY': 29.0,
    'GBP': 0.15,
  };

  final List<String> _currencies = ['BRL', 'USD', 'EUR', 'JPY', 'GBP'];

  void _convert() {
    if (_inputController.text.isEmpty) {
      setState(() { _result = ''; });
      return;
    }
    try {
      double value = double.parse(_inputController.text);
      double fromRate = _rates[_fromCurrency]!;
      double toRate = _rates[_toCurrency]!;
      double resultValue = value * toRate / fromRate;
      setState(() {
        _result = resultValue.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() { _result = 'Entrada inválida'; });
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
      appBar: const CustomAppBar(title: 'Conversor de Moedas'),
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
                      value: _fromCurrency,
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _fromCurrency = newValue!;
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
                      value: _toCurrency,
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _toCurrency = newValue!;
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
                  suffixText: _fromCurrency,
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
                  _result.isEmpty ? 'Resultado' : '$_result $_toCurrency',
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
