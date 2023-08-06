import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/to_do_controller.dart';
import 'package:flutter_assignment_4/UI/Home/Tabs/bmi_tab.dart';
import 'package:flutter_assignment_4/UI/Home/Tabs/to_do_tab.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  RxInt index = 0.obs;
  List<Widget> tabs = [const ToDoTab(), BMITab()];

  String get appTitle => index.value == 0 ? 'To-Do List' : 'BMI Calculator';

  Widget? floatingButton(ToDoController toDoController, BuildContext context) =>
      index.value == 0
          ? FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                toDoController.add(context);
              },
              child: const Icon(Icons.add),
            )
          : null;

  void onPageChange(int page) {
    index.value = page;
  }
}
