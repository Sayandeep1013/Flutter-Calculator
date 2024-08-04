import 'package:flutter/material.dart';
import '../models/calculation.dart';

class HistoryPanel extends StatefulWidget {
  final List<Calculation> history;

  const HistoryPanel({Key? key, required this.history}) : super(key: key);

  @override
  _HistoryPanelState createState() => _HistoryPanelState();
}

class _HistoryPanelState extends State<HistoryPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isExpanded ? 200 : 40,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              height: 40,
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Expanded(
              child: ListView.builder(
                itemCount: widget.history.length,
                itemBuilder: (context, index) {
                  final calculation = widget.history[index];
                  return ListTile(
                    title: Text(calculation.expression),
                    subtitle: Text(calculation.result),
                    onTap: () {
                      // Implement logic to use this calculation
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}