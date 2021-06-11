import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultLabel extends StatelessWidget {
  String text = '';
  double result;
  ResultLabel({Key? key,this.text = '', this.result = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 24,bottom: 10,top: 35),
      width: double.infinity,
      height: 140,
      color: Colors.black,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 27
        )
      ),
    );
  }
}
