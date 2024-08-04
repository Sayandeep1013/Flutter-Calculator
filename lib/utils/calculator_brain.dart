import 'dart:math' as math;

class CalculatorBrain {
  static const String ERROR_MESSAGE = 'Error';

  String evaluate(String expression) {
    try {
      // Replace visual representations with their respective operators
      expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

      // Evaluate the expression
      double result = _evaluateExpression(expression);

      // Format the result
      if (result == result.roundToDouble()) {
        return result.toStringAsFixed(0);
      } else {
        return result.toStringAsFixed(8).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
      }
    } catch (e) {
      return ERROR_MESSAGE;
    }
  }

  double _evaluateExpression(String expression) {
    // Implement a proper expression parser and evaluator here
    // This is a placeholder implementation and doesn't handle complex expressions
    List<String> tokens = expression.split(RegExp(r'(\+|\-|\*|/)'));
    List<String> operators = expression.split(RegExp(r'[^+\-*/]+')).where((s) => s.isNotEmpty).toList();

    double result = double.parse(tokens[0]);
    for (int i = 0; i < operators.length; i++) {
      double nextNumber = double.parse(tokens[i + 1]);
      switch (operators[i]) {
        case '+':
          result += nextNumber;
          break;
        case '-':
          result -= nextNumber;
          break;
        case '*':
          result *= nextNumber;
          break;
        case '/':
          if (nextNumber == 0) throw Exception('Division by zero');
          result /= nextNumber;
          break;
      }
    }

    return result;
  }

  // TODO: Implement additional mathematical functions (sqrt, pi, power, factorial, trig functions, etc.)
}