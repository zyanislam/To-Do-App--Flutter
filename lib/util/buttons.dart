// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color.fromARGB(243, 243, 243, 255),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
