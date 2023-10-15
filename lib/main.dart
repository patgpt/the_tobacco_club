import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tobacco_club/firebase_options.dart';
import 'package:the_tobacco_club/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'The Tobacco Club',
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData.dark(),
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? '/sign-in'
                : '/profile',
            routes: {
              '/sign-in': (context) {
                return SignInScreen(
                  headerBuilder: (context, constraints, shrinkOffset) {
                    return SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/logo250x250.png'),
                    );
                  },
                  providers: [
                    EmailAuthProvider(),
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
        },
      ),
    );
  }
}
