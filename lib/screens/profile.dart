import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_tobacco_club/widgets/my_appbar.dart';
import 'package:the_tobacco_club/widgets/my_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: "My Profile Page", actions: []),
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
