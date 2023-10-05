import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_tobacco_club/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Tobacco Club',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 205, 153)),
        useMaterial3: true,
      ),
      // routes: {
      //   "/": (context) => const MyHomePage(title: 'The Tobacco Club'),
      //   "/signIn": (context) => const MyHomePage(title: 'Sign in'),
      // },
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'The Tobacco Club'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _signIn() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Tobacco Club app!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _signIn,
        tooltip: 'Sign in',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
