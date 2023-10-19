import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const MenuButton(this.buttonText, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText, style: const TextStyle(fontSize: 30)),
      ),
    ));
  }
}
