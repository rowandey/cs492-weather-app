import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Assignment 1-2 TODOs:
// Remove the default comments
// Change the title of the application and the title of the home page to CS492
// Change the seed color to something appealing
// Instead of floating action button, use an elevated button
// Extract your button widget so you can use it multiple times
// Wrap the button in a Row, so you can add more buttons
// Add more buttons for decrementing the counter and doubling the counter.
// Create functions to handle those changes

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 136, 212, 123)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CS492'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(counterFunction: _incrementCounter, symbol: "+"),
                CounterButton(counterFunction: _decrementCounter, symbol: "-"),
                CounterButton(counterFunction: _multiplyCounter, symbol: "*2"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.counterFunction,
    required this.symbol
  });

  final VoidCallback counterFunction;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, shape: StarBorder(points: 8));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(style: style, onPressed: counterFunction, child: Text(symbol))
    );
  }
}
