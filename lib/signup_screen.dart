import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],  // Light blue background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,  // Inner container color
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: MediaQuery.of(context).size.width * 0.9,  // Responsive width
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      // App Logo
                      Image.asset(
                        'assets/logo.png',  // Add your logo file here
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'to continue to Guardia',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Google sign-in button with animation
                      MouseRegion(
                        onEnter: (_) => _onHover(true),
                        onExit: (_) => _onHover(false),
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Add Google sign-in functionality
                            },
                            icon: const Icon(Icons.g_translate, color: Colors.white),
                            label: const Text('Continue with Google',
                                style: TextStyle(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Email or Username input field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email address or username',
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      // Continue button with hover effect
                      MouseRegion(
                        onEnter: (_) => _onHover(true),
                        onExit: (_) => _onHover(false),
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add continue functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,  // Button color
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Continue'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Sign up option
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Add sign-up navigation
                          },
                          child: const Text(
                            'No account? Sign up',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
