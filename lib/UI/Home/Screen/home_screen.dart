import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/About/Screen/about_screen.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/tabs_controller.dart';
import 'package:flutter_assignment_4/UI/Home/Controller/to_do_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String id = '/home';
  final toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<TabsController>(
          init: Get.put(TabsController()),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: Text(controller.appTitle),
                centerTitle: true,
                backgroundColor: Colors.deepPurple,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AboutScreen.id);
                    },
                    icon: const Icon(Icons.info),
                  )
                ],
              ),
              body: controller.tabs.elementAt(controller.index.value),
              floatingActionButton:
                  controller.floatingButton(toDoController, context),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.deepPurple,
                currentIndex: controller.index.value,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.7),
                onTap: (index) {
                  controller.onPageChange(index);
                  controller.update();
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'To-Do',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fitness_center),
                    label: 'BMI',
                  ),
                ],
              ),
            );
          }),
    );
  }
}
