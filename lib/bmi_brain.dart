import 'dart:math';
import 'package:flutter/cupertino.dart';

class Calculator{
  final height;
  final weight;
  double _bmi;
  Calculator({@required this.height,@required this.weight});
  String bmiresult(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String resultText(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'normal';
    }
    else{
      return 'underweight';
    }
  }
  String interpertation(){
    if(_bmi>=25){
      return 'To some exercise.';
    }
    else if(_bmi>18.5){
      return 'Nice, keep it up.';
    }
    else{
      return 'Go and get a good diet.';
    }
  }

}