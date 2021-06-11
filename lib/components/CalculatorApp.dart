import 'package:calculator/components/Calculator.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title:'Calculator',
      home: Scaffold(
        body: Calculator(),
      ),
    );
  }
}
