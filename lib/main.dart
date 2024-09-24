import 'package:b_m_i_project/splashscreen.dart';
import 'package:flutter/material.dart';

import 'calculationpage.dart';
import 'resultpage.dart'; // Import ResultPage

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMICalculatorApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,  // This removes the debug banner
      routes: {
        '/': (context) => const splashscreen(),
        '/calculationpage': (context) => calculationpage(),
        '/ResultPage': (context) => ResultPage(name: '', bmi: 0.0, category: ''), // Add parameters
      },
    );
  }
}
