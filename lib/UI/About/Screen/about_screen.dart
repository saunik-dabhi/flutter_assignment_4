import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String id = '/about';

  @override
  Widget build(BuildContext context) {
    // Scaffold widget is the main structure for the screen layout
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Set app bar background color
        title: const Text('About Us'), // App bar title
      ),
      body: Container(
        width: Get.width, // Set container width to match screen width
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container to display an image
            Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/GeorgianUniversity-logo.jpg', // Load image from assets
                  ),
                  fit: BoxFit.cover, // Fit image inside the container
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Flutter Web Implementation', // Welcome message
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'I am a passionate developer dedicated to creating amazing Flutter apps for my users.',
              // Description text
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us:', // Contact section header
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: 200540779@stdent.georgianc.on.ca', // Contact information
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
