import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String headerText;

  CardHeader([this.headerText = '']);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        headerText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      )
    );
  }
}