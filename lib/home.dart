import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardia'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return _buildMenuOptions(context);
              },
              backgroundColor: Colors.white.withOpacity(0), // Transparent background
              isScrollControlled: true,
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Light Blue Background
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Illustration
                Center(
                  child: Image.asset(
                    'assets/logo.png', // Your illustration here
                    height: 150, // Adjust height for better alignment
                  ),
                ),
                const SizedBox(height: 20),
                // Grid of buttons (2x2 layout)
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2, // Smaller buttons
                    children: [
                      FeatureButton(
                        icon: Icons.phone,
                        label: 'Helpline',
                        onTap: () {
                          // Navigate to helpline page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HelplinePage()));
                        },
                      ),
                      FeatureButton(
                        icon: Icons.camera_alt,
                        label: 'Camera',
                        onTap: () {
                          // Navigate to camera page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                        },
                      ),
                      FeatureButton(
                        icon: Icons.location_on,
                        label: 'Location',
                        onTap: () {
                          // Navigate to location page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage()));
                        },
                      ),
                      FeatureButton(
                        icon: Icons.people,
                        label: 'Parents',
                        onTap: () {
                          // Navigate to parents page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ParentsPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Menu options in bottom sheet
  Widget _buildMenuOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.phone_in_talk),
            title: const Text('Fake Call Setup'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to fake call setup
              Navigator.push(context, MaterialPageRoute(builder: (context) => FakeCallSetupPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Trusted Contacts'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to trusted contacts page
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrustedContactsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings page
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}

// Custom Widget for the Feature Button
class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FeatureButton({super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 5), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 20, // Smaller button size
              child: Icon(icon, color: Colors.white, size: 20), // Smaller icon size
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, // Adjusted for smaller size
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Pages for Features
class HelplinePage extends StatelessWidget {
  const HelplinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send SOS'),
      ),
      body: const Center(child: Text('Helpline Feature Page')),
    );
  }
}

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: const Center(child: Text('Camera Feature Page')),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: const Center(child: Text('Location Feature Page')),
    );
  }
}

class ParentsPage extends StatelessWidget {
  const ParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parents'),
      ),
      body: const Center(child: Text('Parents Feature Page')),
    );
  }
}

class FakeCallSetupPage extends StatelessWidget {
  const FakeCallSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Call Setup'),
      ),
      body: const Center(child: Text('Fake Call Setup Page')),
    );
  }
}

class TrustedContactsPage extends StatelessWidget {
  const TrustedContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trusted Contacts'),
      ),
      body: const Center(child: Text('Trusted Contacts Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page')),
    );
  }
}
