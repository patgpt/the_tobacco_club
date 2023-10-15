import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tobacco_club/constants/constants.dart';
import 'package:the_tobacco_club/providers/theme_provider.dart';
import 'package:the_tobacco_club/widgets/theme_toggle.dart';
import 'package:the_tobacco_club/widgets/my_appbar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign In", actions: []),
      body: SignInScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return const LogoWidget();
        },
        providers: [
          EmailAuthProvider(),
        ],
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            Navigator.pushReplacementNamed(context, '/profile');
          }),
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset(logo, fit: BoxFit.contain),
    );
  }
}
