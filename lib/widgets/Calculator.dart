import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/widgets/CalculatorBtn.dart';
import 'package:calculator/widgets/ResultLabel.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _operationColor = Colors.black12;
  final _equalsColor = Colors.blue;
  var _isErr = false;
  StringBuffer _calculationBuffer = StringBuffer();
  String get calculationBufferContent => _calculationBuffer.isEmpty ? '0' : _calculationBuffer.toString();

  void onButton(String data) {
    setState(() {
      _calculationBuffer.write(data);
    });
  }

  void onClear() {
    setState(() {
      _isErr = false;
      _calculationBuffer.clear();
    });
  }

  void onResult() {
    setState(() {
      String ans;
      try
      {
        var p = Parser();
        var exp =  p.parse(_calculationBuffer.toString());
        ans = exp.evaluate(EvaluationType.REAL,ContextModel()).toString();
        _isErr = false;
      }
      on Exception
      {
        ans = 'Error';
        _isErr = true;
      }
      _calculationBuffer.clear();
      _calculationBuffer.write(ans);
    });
  }

  void onErase() {
    setState(() {
      var content = _calculationBuffer.toString();
      _calculationBuffer.clear();
      content = content.substring(0, content.length - 1);
      _calculationBuffer.write(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ResultLabel(
          text: calculationBufferContent,
          textColor: _isErr ? Colors.red : Colors.white
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: '7', onTap: () => onButton('7'))),
            Expanded(child: CalculatorBtn(label: '8', onTap: () => onButton('8'))),
            Expanded(child: CalculatorBtn(label: '9', onTap: () => onButton('9'))),
            Expanded(child: CalculatorBtn(label: '*', onTap: () => onButton('*'),backgroundColor: _operationColor)),
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: '4', onTap: () => onButton('4'))),
            Expanded(child: CalculatorBtn(label: '5', onTap: () => onButton('5'))),
            Expanded(child: CalculatorBtn(label: '6', onTap: () => onButton('6'))),
            Expanded(child: CalculatorBtn(label: '/', onTap: () => onButton('/'),backgroundColor: _operationColor))
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: '1', onTap: () => onButton('1'))),
            Expanded(child: CalculatorBtn(label: '2', onTap: () => onButton('2'))),
            Expanded(child: CalculatorBtn(label: '3', onTap: () => onButton('3'))),
            Expanded(child: CalculatorBtn(label: '+', onTap: () => onButton('+'),backgroundColor: _operationColor))
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: '0', onTap: () => onButton('0'))),
            Expanded(child: CalculatorBtn(label: '.', onTap: () => onButton('.'))),
            Expanded(child: CalculatorBtn(label: '%', onTap: () => onButton('%'))),
            Expanded(child: CalculatorBtn(label: '-', onTap: () => onButton('-'),backgroundColor: _operationColor))
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: 'ln', onTap: () => onButton('ln'),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: 'e', onTap: () => onButton('e'),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: 'sqrt', onTap: () => onButton('sqrt'),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: 'sin', onTap: () => onButton('sin'),backgroundColor: _operationColor)),
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: 'cos', onTap: () => onButton('cos'),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: 'tan', onTap: () => onButton('tan'),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: 'C', onTap: () => onClear(),backgroundColor: _operationColor)),
            Expanded(child: CalculatorBtn(label: '<-', onTap: () => onErase(),backgroundColor: _operationColor))
          ]
        ),
        Row(
          children: <Widget>[
            Expanded(child: CalculatorBtn(label: '=', onTap: () => onResult(),backgroundColor: _equalsColor)),
          ]
        )
      ]
    );
  }
}
