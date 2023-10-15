import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_tobacco_club/providers/theme_provider.dart';
import 'package:the_tobacco_club/widgets/my_appbar.dart';
import 'package:the_tobacco_club/widgets/my_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(title: "My Profile Page", actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            /// show a SnackBar and tell they they are already on the profile page
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are already on the profile page.'),
              ),
            );
          },
        ),
      ]),
      body: ProfileScreen(
        providers: [
          EmailAuthProvider(),
        ],
        actions: [
          SignedOutAction((context) {
            /// show a SnackBar and tell they they are signed out
            /// and navigate to the sign in page
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are now signed out.'),
              ),
            );
            Navigator.pushReplacementNamed(context, '/sign-in');
          }),
        ],
      ),
    );
  }
}
