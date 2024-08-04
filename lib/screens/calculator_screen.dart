import 'package:flutter/material.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_button.dart';
import '../widgets/history_panel.dart';
import '../widgets/function_buttons.dart';
import '../widgets/extended_functions_panel.dart';
import '../models/calculator_state.dart';
import '../utils/calculator_brain.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorState _calculatorState = CalculatorState();
  final CalculatorBrain _calculatorBrain = CalculatorBrain();
  bool _isExtendedFunctionsVisible = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      _calculatorState.addToExpression(buttonText);
    });
  }

  void _calculate() {
    setState(() {
      _calculatorState.setResult(
        _calculatorBrain.evaluate(_calculatorState.expression)
      );
      _calculatorState.addToHistory();
    });
  }

  void _clearAll() {
    setState(() {
      _calculatorState.clear();
    });
  }

  void _toggleExtendedFunctions() {
    setState(() {
      _isExtendedFunctionsVisible = !_isExtendedFunctionsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Toggle theme (implement this functionality)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          HistoryPanel(history: _calculatorState.history),
          CalculatorDisplay(
            expression: _calculatorState.expression,
            result: _calculatorState.result,
          ),
          FunctionButtons(
            onPressed: _onButtonPressed,
            onToggleExtended: _toggleExtendedFunctions,
          ),
          if (_isExtendedFunctionsVisible)
            ExtendedFunctionsPanel(onPressed: _onButtonPressed),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalculatorButton(text: 'AC', onPressed: _clearAll),
                CalculatorButton(text: '(', onPressed: () => _onButtonPressed('(')),
                CalculatorButton(text: ')', onPressed: () => _onButtonPressed(')')),
                CalculatorButton(text: '÷', onPressed: () => _onButtonPressed('÷')),
                CalculatorButton(text: '7', onPressed: () => _onButtonPressed('7')),
                CalculatorButton(text: '8', onPressed: () => _onButtonPressed('8')),
                CalculatorButton(text: '9', onPressed: () => _onButtonPressed('9')),
                CalculatorButton(text: '×', onPressed: () => _onButtonPressed('×')),
                CalculatorButton(text: '4', onPressed: () => _onButtonPressed('4')),
                CalculatorButton(text: '5', onPressed: () => _onButtonPressed('5')),
                CalculatorButton(text: '6', onPressed: () => _onButtonPressed('6')),
                CalculatorButton(text: '-', onPressed: () => _onButtonPressed('-')),
                CalculatorButton(text: '1', onPressed: () => _onButtonPressed('1')),
                CalculatorButton(text: '2', onPressed: () => _onButtonPressed('2')),
                CalculatorButton(text: '3', onPressed: () => _onButtonPressed('3')),
                CalculatorButton(text: '+', onPressed: () => _onButtonPressed('+')),
                CalculatorButton(text: '0', onPressed: () => _onButtonPressed('0')),
                CalculatorButton(text: '.', onPressed: () => _onButtonPressed('.')),
                CalculatorButton(text: '⌫', onPressed: () {
                  setState(() {
                    _calculatorState.removeLastCharacter();
                  });
                }),
                CalculatorButton(text: '=', onPressed: _calculate),
              ],
            ),
          ),
        ],
      ),
    );
  }
}