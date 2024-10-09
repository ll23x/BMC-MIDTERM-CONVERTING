import 'package:flutter/material.dart';

// Widget para sa pagpapakita ng counter that has no own state
class Counter extends StatelessWidget {
  final int count; // Kasalukuyang bilang na ipinapasa mula sa parent
  final VoidCallback onIncrement; // Callback function mula sa parent

  const Counter({
    super.key,
    required this.count,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: onIncrement, // Call the function to increment
          child: const Text('Increment'), // Button text
        ),
        const SizedBox(width: 16),
        Text('Count: $count'), // Display the current count
      ],
    );
  }
}

// Stateful widget na nagmamanage ng counter state
class CounterParent extends StatefulWidget {
  const CounterParent({super.key});

  @override
  _CounterParentState createState() => _CounterParentState();
}

class _CounterParentState extends State<CounterParent> {
  int _counter = 0; 

  // Function to increment the count
  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(
        count: _counter,
        onIncrement: _incrementCounter, 
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CounterParent(), // Show the parent widget that manages the state
      ),
    ),
  );
}
