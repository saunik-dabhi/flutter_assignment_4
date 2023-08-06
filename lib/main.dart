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
    return GetMaterialApp(
      title: 'Flutter Assignment 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: GreetingsScreen.id,
      home: const GreetingsScreen(),
      routes: {
        GreetingsScreen.id: (context) => const GreetingsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AboutScreen.id: (context) => const AboutScreen(),
      },
    );
  }
}
