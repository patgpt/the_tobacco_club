import 'package:flutter/material.dart';
import 'package:the_tobacco_club/screens/home.dart';
import 'package:the_tobacco_club/screens/profile.dart';
import 'package:the_tobacco_club/screens/settings.dart';
import 'package:the_tobacco_club/screens/signin.dart';

final Map<String, WidgetBuilder> routes = {
  MyHome.routeName: (context) => const MyHome(),
  SignInPage.routeName: (context) => const SignInPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  SettingsPage.routeName: (context) => const SettingsPage(),
};
