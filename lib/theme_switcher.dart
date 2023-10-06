import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemeSwitch extends StatefulWidget {
  final ValueChanged<ThemeMode> onChanged;

  const ThemeSwitch({Key? key, required this.onChanged}) : super(key: key);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSwitch(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                widget.onChanged(value ? ThemeMode.dark : ThemeMode.light);
              });
            },
          )
        : Switch(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                widget.onChanged(value ? ThemeMode.dark : ThemeMode.light);
              });
            },
          );
  }
}
