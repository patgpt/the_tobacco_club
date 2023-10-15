import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_tobacco_club/color_schemes.dart';
import 'package:the_tobacco_club/constants/constants.dart';
import 'package:the_tobacco_club/constants/routes.dart';
import 'package:the_tobacco_club/firebase_options.dart';
import 'package:the_tobacco_club/providers/auth_provider.dart';
import 'package:the_tobacco_club/providers/theme_provider.dart';
import 'package:the_tobacco_club/screens/home.dart';
import 'package:the_tobacco_club/screens/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  final storage = FirebaseStorage.instance;

  final config = FirebaseUIStorageConfiguration(
    storage: storage,
    uploadRoot: storage.ref('user-uploads'),
    namingPolicy:
        const UuidFileUploadNamingPolicy(), // optional, will generate a UUID for each uploaded file
  );

  await FirebaseUIStorage.configure(config);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // determine PWA colorScheme

    // Set the status bar color to match the app bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MyAuthProvider>(create: (_) => MyAuthProvider()),
      ],
      child: Consumer2<ThemeProvider, MyAuthProvider>(
        builder: (context, themeProvider, myAuthProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
            ],
            themeMode: themeProvider.themeMode,
            theme: ThemeData.from(colorScheme: lightColorScheme),
            darkTheme: ThemeData.from(colorScheme: darkColorScheme),
            initialRoute: determineInitialRoute(myAuthProvider),
            routes: routes,
          );
        },
      ),
    );
  }

  String determineInitialRoute(MyAuthProvider myAuthProvider) {
    return myAuthProvider.isAuthenticated
        ? MyHome.routeName
        : SignInPage.routeName;
  }
}
