import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tobacco_club/providers/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
      onPressed: () {
        provider.toggleTheme();
      },
    );
  }
}
