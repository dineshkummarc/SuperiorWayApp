import 'package:flutter/material.dart';
import 'package:project/screens/attandance_page.dart'; // Import AttendancePage
import 'package:project/screens/bus_schedule_page.dart'; // Import BusSchedulePage
import 'package:project/screens/fee_payment_page.dart'; // Import FeePaymentScreen
import 'package:project/screens/feedback_page.dart'; // Import FeedbackScreen
import 'package:project/screens/home_page.dart'; // Import HomePage
import 'package:project/screens/live_location_page.dart'; // Import LiveLocationPage
import 'package:project/screens/profile_page.dart'; // Import ProfilePage
import 'package:project/screens/profile_page_zubair.dart'; // Import ProfilePageZubair
import 'package:project/screens/sign_in.dart'; // Import SignInScreen
import 'package:project/screens/sign_up.dart'; // Import SignUpScreen
import 'package:project/screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(const SuperiorWayApp());
}

class SuperiorWayApp extends StatelessWidget {
  const SuperiorWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'SuperiorWay Transport',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set primary color
        scaffoldBackgroundColor: Colors.white, // Set background color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Customize text theme
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // For titles
          bodyMedium: TextStyle(fontSize: 16), // For body text
        ),
        // Customize button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      // Define app routes
      routes: {
        '/': (context) => SplashScreen(), // SplashScreen as the initial route
        'sign_in': (context) => SignInScreen(), // SignInScreen
        'sign_up': (context) => SignUpScreen(), // SignUpScreen
        'home': (context) => HomePage(), // HomePage
        'attendance': (context) => AttendancePage(), // AttendancePage
        'fee_payment': (context) => FeePaymentScreen(), // FeePaymentScreen
        'bus_schedule': (context) => BusSchedulePage(), // BusSchedulePage
        'profile': (context) =>  ProfilePage(), // ProfilePage
        '/profile_zubair': (context) => ProfilePageZubair(), // ProfilePageZubair
        'live_location': (context) => LiveLocationPage(), // LiveLocationPage
        'feedback': (context) => FeedbackScreen(), // FeedbackScreen
      },
    );
  }
}