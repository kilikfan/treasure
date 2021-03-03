import 'package:flutter/material.dart';

Widget heading(String text) => Text(text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ));

Widget iconText(IconData icon, Color iconColor, String text) => Padding(
    padding: EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Icon(icon, color: iconColor),
        Flexible(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )))
      ],
    ));

Widget plainText(String text) => Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
