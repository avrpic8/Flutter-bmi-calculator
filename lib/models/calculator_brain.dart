import 'dart:math';
import 'dart:ui';

import 'package:bmi_calculator/util/constants.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  late double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return kOverweight;
    } else if (_bmi > 18.5) {
      return kNormal;
    } else {
      return kUnderweight;
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return kOverweightInterpretation;
    } else if (_bmi > 18.5) {
      return kNormalInterpretation;
    } else {
      return kUnderweightInterpretation;
    }
  }

  Color getResultColor() {
    if (_bmi >= 25) {
      return kCustomizedRed;
    } else if (_bmi > 18.5) {
      return kCustomizedGreen;
    } else {
      return kCustomizedYellow;
    }
  }
}
