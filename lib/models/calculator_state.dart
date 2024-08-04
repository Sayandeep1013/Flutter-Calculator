import 'calculation.dart';

class CalculatorState {
  String _expression = '';
  String _result = '';
  List<Calculation> _history = [];

  String get expression => _expression;
  String get result => _result;
  List<Calculation> get history => List.unmodifiable(_history);

  void addToExpression(String value) {
    _expression += value;
  }

  void setResult(String value) {
    _result = value;
  }

  void clear() {
    _expression = '';
    _result = '';
  }

  void removeLastCharacter() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  void addToHistory() {
    if (_expression.isNotEmpty && _result.isNotEmpty) {
      _history.insert(0, Calculation(expression: _expression, result: _result));
      if (_history.length > 5) {
        _history.removeLast();
      }
    }
  }

  void clearHistory() {
    _history.clear();
  }
}