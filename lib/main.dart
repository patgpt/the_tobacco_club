import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tobacco_club/color_schemes.dart';
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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'The Tobacco Club',
            themeMode: themeProvider.themeMode,
            theme: ThemeData.from(colorScheme: lightColorScheme),
            darkTheme: ThemeData.from(colorScheme: darkColorScheme),
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? '/sign-in'
                : '/profile',
            routes: {
              '/sign-in': (context) => const SignInPage(),
              '/profile': (context) => const ProfilePage(),
            },
          );
        },
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('Sign In'),
      ),
      body: SignInScreen(
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
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen.
            },
          ),
        ],
      ),
      body: ProfileScreen(
        providers: [
          EmailAuthProvider(),
        ],
        actions: [
          SignedOutAction((context) {
            Navigator.pushReplacementNamed(context, '/sign-in');
          }),
        ],
      ),
    );
  }
}
