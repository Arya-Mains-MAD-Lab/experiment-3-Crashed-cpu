import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final a = TextEditingController();
  final b = TextEditingController();
  double result = 0;

  @override
  void dispose() {
    a.dispose();
    b.dispose();
    super.dispose();
  }

  double _getValue(TextEditingController controller) {
    return double.tryParse(controller.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: a,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter first number"),
            ),
            TextField(
              controller: b,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter second number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _getValue(a) + _getValue(b);
                });
              },
              child: const Text("Add"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _getValue(a) - _getValue(b);
                });
              },
              child: const Text("Subtract"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _getValue(a) * _getValue(b);
                });
              },
              child: const Text("Multiply"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_getValue(b) != 0) {
                    result = _getValue(a) / _getValue(b);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Cannot divide by zero"),
                      ),
                    );
                  }
                });
              },
              child: const Text("Divide"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _getValue(a) % _getValue(b);
                });
              },
              child: const Text("Mod"),
            ),
            const SizedBox(height: 20),
            Text("Result: ${result.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
