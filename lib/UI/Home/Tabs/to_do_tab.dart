import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/to_do_controller.dart';
import 'package:get/get.dart';

class ToDoTab extends StatelessWidget {
  const ToDoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoController>(
      init: Get.find<ToDoController>(),
      builder: (controller) {
        return controller.todos.isEmpty
            ? const Center(
                child: Text(
                  'You do not have any to-dos. Please add some.',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.orange,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    // Space between cards
                    child: ListTile(
                      title: Text(
                        controller.todos[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
