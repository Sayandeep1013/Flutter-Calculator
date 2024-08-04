import 'package:flutter/material.dart';
import 'calculator_button.dart';

class FunctionButtons extends StatelessWidget {
  final Function(String) onPressed;
  final VoidCallback onToggleExtended;

  const FunctionButtons({
    Key? key,
    required this.onPressed,
    required this.onToggleExtended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalculatorButton(
          text: '√',
          onPressed: () => onPressed('√'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
        CalculatorButton(
          text: 'π',
          onPressed: () => onPressed('π'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
        CalculatorButton(
          text: '^',
          onPressed: () => onPressed('^'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
        CalculatorButton(
          text: '!',
          onPressed: () => onPressed('!'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
        CalculatorButton(
          text: '▼',
          onPressed: onToggleExtended,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
      ],
    );
  }
}