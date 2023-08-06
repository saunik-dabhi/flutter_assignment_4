import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/bmi_controller.dart';
import 'package:get/get.dart';

class BMITab extends StatelessWidget {
  BMITab({super.key});

  // Text editing controllers for weight and height inputs
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // GetBuilder widget listens for changes in BMIController to rebuild UI
    return GetBuilder<BMIController>(
      init: Get.put(BMIController()), // Initialize BMIController
      builder: (controller) {
        // Widget for the BMI calculation tab
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input field for entering weight in kg
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Weight (kg)',
                  border:
                      OutlineInputBorder(), // Add a border to the input field
                ),
              ),
              const SizedBox(height: 16.0),
              // Input field for entering height in cm
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height (cm)',
                  border:
                      OutlineInputBorder(), // Add a border to the input field
                ),
              ),
              const SizedBox(height: 16.0),
              // Button to calculate BMI
              ElevatedButton(
                onPressed: () {
                  controller.calculateBMI(
                      weightController, heightController); // Calculate BMI
                  weightController.clear(); // Clear weight input
                  heightController.clear(); // Clear height input
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  // Set button background color
                  minimumSize: Size.fromHeight(Get.height * 0.07),
                  // Set button height
                  onPrimary: Colors.white,
                  // Set button text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // Rounded corners for the button
                  ),
                ),
                child: const Text('Calculate BMI'), // Button text
              ),
              const SizedBox(height: 16.0),
              // Display BMI result and category if BMI is calculated
              if (controller.bmi.value != 0)
                Column(
                  children: [
                    Text(
                      'Your BMI: ${controller.bmi.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Category: ${controller.category}',
                      // Display BMI category
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
