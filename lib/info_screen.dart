import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Change the background color to white or any color you prefer
      body: Stack(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Guardia is a women\'s safety app designed to provide security and peace of mind. It uses advanced AI to ensure safety through real-time monitoring and location tracking.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned button at the bottom center
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');  // Navigate to the signup page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],  // Light pink button color
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,  // Right arrow icon
                  color: Colors.white,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
