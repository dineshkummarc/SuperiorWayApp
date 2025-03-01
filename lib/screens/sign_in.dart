import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Import AuthService
import '../utils/app_colors.dart'; // Import AppColors
import '../widgets/custom_button.dart'; // Import CustomButton
import '../widgets/input_field.dart'; // Import InputField

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});

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
            SizedBox(height: 20),
            // Sign In Button
            CustomButton(
              text: 'Sign In',
              onPressed: () {
                // Validate and sign in
                if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all fields.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  bool isAuthenticated = AuthService.signIn(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (isAuthenticated) {
                    Navigator.pushReplacementNamed(context, 'home'); // Navigate to home
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid email or password.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            ),
            SizedBox(height: 10),
            // Sign Up Prompt
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign_up'); // Navigate to sign up
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: AppColors.primary), // Use AppColors for text
              ),
            ),
          ],
        ),
      ),
    );
  }
}