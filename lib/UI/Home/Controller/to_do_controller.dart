import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  RxList<String> todos = <String>[].obs; // RxList to hold the list of todos

  // Method to add a new to do item
  void add(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = ''; // Variable to hold the new to do text
        return AlertDialog(
          title: const Text('Add To-Do'), // Dialog title
          content: TextField(
            // TextField to input the new to do
            onChanged: (value) {
              newTodo = value; // Update the new to do text as the user types
            },
          ),
          actions: [
            // Dialog actions (Add and Cancel buttons)
            TextButton(
              onPressed: () {
                // Check if the new to do is not empty
                if (newTodo.isNotEmpty) {
                  todos.add(newTodo); // Add the new to do to the list
                  update(); // Trigger a UI update to reflect the changes
                  Get.back(); // Close the dialog
                }
              },
              child: const Text('Add'), // Add button text
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog when Cancel is pressed
              },
              child: const Text('Cancel'), // Cancel button text
            ),
          ],
        );
      },
    );
  }
}
