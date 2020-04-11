import 'package:flutter/material.dart';

class CardActionText extends StatelessWidget {
  final String actionText;

  CardActionText([this.actionText = '']);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        actionText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}