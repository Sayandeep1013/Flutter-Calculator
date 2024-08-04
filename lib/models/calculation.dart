class Calculation {
  final String expression;
  final String result;

  Calculation({required this.expression, required this.result});

  // Add a method to convert the Calculation to a Map
  Map<String, dynamic> toMap() {
    return {
      'expression': expression,
      'result': result,
    };
  }

  // Add a factory method to create a Calculation from a Map
  factory Calculation.fromMap(Map<String, dynamic> map) {
    return Calculation(
      expression: map['expression'],
      result: map['result'],
    );
  }
}