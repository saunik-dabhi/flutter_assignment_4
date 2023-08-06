import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/to_do_controller.dart';
import 'package:get/get.dart';

class ToDoTab extends StatelessWidget {
  const ToDoTab({super.key});

  @override
  Widget build(BuildContext context) {
    // GetBuilder widget listens for changes in ToDoController to rebuild UI
    return GetBuilder<ToDoController>(
      init: Get.find<ToDoController>(), // Initialize ToDoController
      builder: (controller) {
        // If the to do list is empty, display a message; otherwise, show the list of todos
        return controller.todos.isEmpty
            ? const Center(
                child: Text(
                  'You do not have any to-dos. Please add some.',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            : ListView.builder(
                // Display the list of todos using ListView.builder
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.deepPurple.shade200,
                    // Set card background color
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners for the card
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    // Space between cards
                    child: ListTile(
                      title: Text(
                        controller.todos[index], // Display the to do text
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color for todos
                        ),
                      ),
                    ),
                  );
                }),
                itemCount: controller.todos.length,
              );
      },
    );
  }
}
