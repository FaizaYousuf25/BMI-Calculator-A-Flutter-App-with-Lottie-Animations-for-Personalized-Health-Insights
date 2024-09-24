import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {
  final String name;
  final double bmi;
  final String category;

  const ResultPage({
    Key? key,
    required this.name,
    required this.bmi,
    required this.category,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  // Method to get the Lottie animation path based on BMI category
  String getAnimation() {
    if (widget.category == "Underweight" || widget.category == "Normal weight") {
      return 'assets/lottie/Animation happy.json';  // Path for happy animation
    } else if (widget.category == "Overweight" || widget.category == "Obesity") {
      return 'assets/lottie/Animation sad.json';    // Path for sad animation
    }
    return 'assets/lottie/Animation happy.json';  // Default to happy animation
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.42,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie animation based on BMI category
                Lottie.asset(
                  getAnimation(),
                  width: 200,  // You can adjust size as needed
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),
                Text(
                  'Hello, ${widget.name}!',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your BMI is: ${widget.bmi.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B7B70),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Category: ${widget.category}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 22),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B7B70),
                    ),
                  ),
                  child: const Text('Back', style: TextStyle(color: Color(0xFF1B7B70))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
