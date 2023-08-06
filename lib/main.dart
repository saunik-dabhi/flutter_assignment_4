import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/About/Screen/about_screen.dart';
import 'package:flutter_assignment_4/UI/Greetings/Screen/greetings_screen.dart';
import 'package:flutter_assignment_4/UI/Home/Screen/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The main app widget, responsible for app setup and configuration
    return GetMaterialApp(
      title: 'Flutter Assignment 4',
      // App title shown in the app switcher
      theme: ThemeData(
        primarySwatch: Colors.blue, // Main color theme for the app
      ),
      debugShowCheckedModeBanner: false,
      // Hide the debug banner in the app
      initialRoute: GreetingsScreen.id,
      // Initial route to be displayed when the app starts
      home: const GreetingsScreen(),
      // Default home screen set to the GreetingsScreen
      routes: {
        // Define routes for navigation
        GreetingsScreen.id: (context) => const GreetingsScreen(),
        // GreetingsScreen route
        HomeScreen.id: (context) => HomeScreen(),
        // HomeScreen route
        AboutScreen.id: (context) => const AboutScreen(),
        // AboutScreen route
      },
    );
  }
}
