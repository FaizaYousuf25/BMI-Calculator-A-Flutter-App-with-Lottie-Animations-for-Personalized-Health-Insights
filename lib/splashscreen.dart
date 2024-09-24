import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B7B70),
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 81),
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 30.42,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Image.asset(
                'assets/123.png',
                height: 289,
                width: 318,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/calculationpage');
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
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Color(0xFF1B7B70)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
