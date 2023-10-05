import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, TwitterAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_twitter/firebase_ui_oauth_twitter.dart';
import 'package:flutter/material.dart';
import 'package:the_tobacco_club/env.dart';
import 'package:the_tobacco_club/firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    TwitterProvider(
      apiKey: TWITTER_KEY,
      apiSecretKey: TWITTER_SECRET,
    ),
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              TwitterProvider(apiKey: TWITTER_KEY, apiSecretKey: TWITTER_SECRET)
            ],
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(context, '/profile');
              }),
            ],
          );
        },
        '/profile': (context) {
          return ProfileScreen(
            providers: [
              EmailAuthProvider(),
              TwitterProvider(apiKey: TWITTER_KEY, apiSecretKey: TWITTER_SECRET)
            ],
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }),
            ],
          );
        },
      },
    );
  }
}
