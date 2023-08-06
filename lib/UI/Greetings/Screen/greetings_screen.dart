import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/UI/Home/Screen/home_screen.dart';
import 'package:get/get.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  static const String id = '/greetings';

  @override
  Widget build(BuildContext context) {
    // Scaffold is the main structure for the screen layout
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background gradient for the screen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Column to vertically align the content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome text with a shadow effect
              Text(
                'Welcome to Flutter Delights!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Image from Internet
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPTPM5pMeLTDHivJQe8NeE7fAf64Z_ybNHrw&usqp=CAU',
                height: Get.height * 0.5,
              ),
              const SizedBox(height: 20),
              // Button to navigate to the HomeScreen
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.id);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
