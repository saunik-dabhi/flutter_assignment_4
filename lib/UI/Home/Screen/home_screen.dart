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
    // Ensures content is placed inside the safe area on screen
    return SafeArea(
      // GetBuilder widget listens for changes in TabsController to rebuild UI
      child: GetBuilder<TabsController>(
        init: Get.put(TabsController()), // Initialize TabsController
        builder: (controller) {
          // Main scaffold for the home screen layout
          return Scaffold(
            appBar: AppBar(
              // App bar with the app title and info icon
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
            // Body section that displays the current tab content
            body: controller.tabs.elementAt(controller.index.value),
            // Floating action button configured by the controller
            floatingActionButton:
                controller.floatingButton(toDoController, context),
            bottomNavigationBar: BottomNavigationBar(
              // Bottom navigation bar with two tabs
              backgroundColor: Colors.deepPurple,
              currentIndex: controller.index.value,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.7),
              // Handles navigation when tapping on a tab
              onTap: (index) {
                controller.onPageChange(index);
                controller.update();
              },
              // Defines the tabs and their labels
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
        },
      ),
    );
  }
}
