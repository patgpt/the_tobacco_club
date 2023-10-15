import 'package:flutter/material.dart';
import 'package:the_tobacco_club/constants/constants.dart';
import 'package:the_tobacco_club/widgets/theme_toggle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final ThemeToggle themeToggle = const ThemeToggle();
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(logo, height: 30, width: 30),
          ),
          Text(title),
        ],
      ),
      elevation: 2,
      centerTitle: true,
      actions: [themeToggle, ...actions],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
