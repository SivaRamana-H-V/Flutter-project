import 'package:flutter/material.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 44, 46, 67),
            ),
            child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 18),
          width: 70,
          child: const Image(
            image: AssetImage("assets/Logo.png"),
          ),
        ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to the Home page here
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation to the Settings page here
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              // Handle navigation to the Help page here
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
