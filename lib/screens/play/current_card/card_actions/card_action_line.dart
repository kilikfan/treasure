import 'package:flutter/material.dart';

class CardActionLine extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  CardActionLine(this.text, this.icon, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: iconColor),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
