import 'package:flutter/material.dart';
import 'sign_in.dart'; // Import the SignInScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SignInScreen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your Logo
            Image.asset(
              'assets/superiorway_logo.png', // Replace with your logo asset path
              width: 150, // Adjust the size as needed
              height: 150,
            ),
            SizedBox(height: 20), // Add some spacing
            // Optional: Add a loading indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800), // Match app theme
            ),
          ],
        ),
      ),
    );
  }
}