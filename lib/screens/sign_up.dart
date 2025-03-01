import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // Import AppColors
import '../widgets/custom_button.dart'; // Import CustomButton
import '../widgets/input_field.dart'; // Import InputField

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Use AppColors for background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/superiorway_logo.png', // Replace with your logo
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Email Input Field
            InputField(
              label: 'Email',
              controller: _emailController,
            ),
            SizedBox(height: 16),
            // Password Input Field
            InputField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            SizedBox(height: 16),
            // Confirm Password Input Field
            InputField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              isPassword: true,
            ),
            SizedBox(height: 20),
            // Sign Up Button
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                // Validate and sign up
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _confirmPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all fields.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (_passwordController.text != _confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Passwords do not match.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  // Simulate sign-up (you can replace this with actual sign-up logic)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sign up successful!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pushReplacementNamed(context, 'home'); // Navigate to home
                }
              },
            ),
            SizedBox(height: 10),
            // Sign In Prompt
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign_in'); // Navigate to sign in
              },
              child: Text(
                "Already have an account? Sign In",
                style: TextStyle(color: AppColors.primary), // Use AppColors for text
              ),
            ),
          ],
        ),
      ),
    );
  }
}