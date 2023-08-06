import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxDouble bmi = 0.0.obs;

  void calculateBMI(
      TextEditingController weightCon, TextEditingController heightCon) {
    var weight = double.tryParse(weightCon.text) ?? 0;
    var height = double.tryParse(heightCon.text) ?? 0;
    if (weight > 0 && height > 0) {
      bmi.value = weight / ((height / 100) * (height / 100));
    }
    update();
  }

  String get category {
    var mass = bmi.value;
    if (mass < 18.5) {
      return 'Underweight';
    } else if (mass >= 18.5 && mass <= 24.9) {
      return 'Normal Weight';
    } else if (mass >= 25 && mass <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
