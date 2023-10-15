import 'package:flutter/material.dart';
import 'package:the_tobacco_club/constants/constants.dart';
import 'package:the_tobacco_club/widgets/forms/basic_info.dart';
import 'package:the_tobacco_club/widgets/my_appbar.dart';
import 'package:the_tobacco_club/widgets/my_drawer.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: homePageTitle,
      ),
      drawer: CustomDrawer(),
      body: MyForm(),
    );
  }
}
