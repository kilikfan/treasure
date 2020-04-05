import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  MenuButton(this.buttonText, {Function onPressed}):
    this.onPressed = onPressed; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.green,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30)
        ),
      ),
    );
  }
}
