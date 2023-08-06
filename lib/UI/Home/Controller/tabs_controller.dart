import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/to_do_controller.dart';
import 'package:flutter_assignment_4/UI/Home/Tabs/bmi_tab.dart';
import 'package:flutter_assignment_4/UI/Home/Tabs/to_do_tab.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  RxInt index = 0.obs; // Reactive variable to hold the current tab index
  List<Widget> tabs = [
    const ToDoTab(),
    BMITab()
  ]; // List of tabs (ToDoTab and BMITab)

  // Method to get the app title based on the selected tab index
  String get appTitle => index.value == 0 ? 'To-Do List' : 'BMI Calculator';

  // Method to return the floating action button based on the selected tab
  Widget? floatingButton(ToDoController toDoController, BuildContext context) =>
      index.value == 0
          ? FloatingActionButton(
              backgroundColor: Colors.deepPurple, // Set button background color
              onPressed: () {
                toDoController
                    .add(context); // Trigger the add method in ToDoController
              },
              child: const Icon(Icons.add), // Button icon
            )
          : null; // Return null for the BMI tab

  // Method to handle page changes when tapping on a tab
  void onPageChange(int page) {
    index.value = page; // Update the index to the selected tab index
  }
}
