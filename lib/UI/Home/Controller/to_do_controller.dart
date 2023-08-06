import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  RxList<String> todos = <String>[].obs;

  void add(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = '';
        return AlertDialog(
          title: Text('Add To-Do'),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newTodo.isNotEmpty) {
                  todos.add(newTodo);
                  update();
                  Get.back();
                }
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
