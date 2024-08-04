import 'package:flutter/material.dart';
import 'calculator_button.dart';

class ExtendedFunctionsPanel extends StatelessWidget {
  final Function(String) onPressed;

  const ExtendedFunctionsPanel({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: 'DEG',
                onPressed: () => onPressed('DEG'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'sin',
                onPressed: () => onPressed('sin'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'cos',
                onPressed: () => onPressed('cos'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'tan',
                onPressed: () => onPressed('tan'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: 'INV',
                onPressed: () => onPressed('INV'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'e',
                onPressed: () => onPressed('e'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'ln',
                onPressed: () => onPressed('ln'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              CalculatorButton(
                text: 'log',
                onPressed: () => onPressed('log'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}