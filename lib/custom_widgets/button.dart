import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const Button({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      child: Text(label),
    );
  }
}
