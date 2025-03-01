// import 'package:flutter/material.dart';
//
// class InputField extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   final bool isPassword;
//
//   InputField({required this.label, required this.controller, this.isPassword = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       decoration: InputDecoration(labelText: label),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // Import app_colors

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType? keyboardType;

  const InputField({super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}