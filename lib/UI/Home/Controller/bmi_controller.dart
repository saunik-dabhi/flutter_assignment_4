import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxDouble bmi = 0.0.obs; // Reactive variable to hold the calculated BMI

  // Method to calculate BMI based on weight and height inputs
  void calculateBMI(
      TextEditingController weightCon, TextEditingController heightCon) {
    // Get the weight and height values from the input controllers
    var weight = double.tryParse(weightCon.text) ?? 0;
    var height = double.tryParse(heightCon.text) ?? 0;
    // Calculate BMI only if weight and height are greater than 0
    if (weight > 0 && height > 0) {
      bmi.value =
          weight / ((height / 100) * (height / 100)); // BMI calculation formula
    }
    update(); // Trigger a UI update to reflect the calculated BMI
  }

  // Method to get the BMI category based on the calculated BMI value
  String get category {
    var mass = bmi.value; // Get the calculated BMI value
    // Determine the category based on the BMI range
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
