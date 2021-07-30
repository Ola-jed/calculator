import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalculatorBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color labelColor;
  double size;
  CalculatorBtn(
      {required this.label,
      required this.onTap,
      this.backgroundColor = Colors.teal,
      this.labelColor = Colors.white,
      this.size = 80.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ], color: backgroundColor),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 24, color: labelColor),
            ),
          ),
        ),
      ),
    );
  }
}
