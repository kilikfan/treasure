import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const MenuButton(this.buttonText, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText, style: const TextStyle(fontSize: 30)),
      ),
    );
  }
}
