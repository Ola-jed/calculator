import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultLabel extends StatelessWidget {
  final text;
  final textColor;
  ResultLabel({Key? key, this.text = '', this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 24, bottom: 10, top: 35),
      width: double.infinity,
      height: 140,
      color: Colors.black,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 27,
        ),
      ),
    );
  }
}
