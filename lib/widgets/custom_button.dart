// import 'package:flutter/material.dart';
//
// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//
//   CustomButton({required this.text, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // Import app_colors

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const CustomButton({super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.buttonPrimary : AppColors.buttonSecondary,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isPrimary ? Colors.white : AppColors.textPrimary,
        ),
      ),
    );
  }
}