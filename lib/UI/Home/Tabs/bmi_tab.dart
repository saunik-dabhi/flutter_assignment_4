import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/bmi_controller.dart';
import 'package:get/get.dart';

class BMITab extends StatelessWidget {
  BMITab({super.key});

  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BMIController>(
      init: Get.put(BMIController()),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Weight (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  controller.calculateBMI(weightController, heightController);
                  weightController.clear();
                  heightController.clear();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  minimumSize: Size.fromHeight(Get.height * 0.07),
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 16.0),
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
