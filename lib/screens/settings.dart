import 'package:flutter/material.dart';
import 'package:the_tobacco_club/widgets/theme_toggle.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Theme'),
          leading: const ThemeToggle(),
          onTap: () {
            /// show a SnackBar and tell they they are already on the settings page
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are already on the settings page.'),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Profile'),
          leading: const Icon(Icons.person),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          title: const Text('Sign Out'),
          leading: const Icon(Icons.logout),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/sign-in');
          },
        ),
      ],
    );
  }
}
