import 'package:flutter/material.dart';

Widget heading(String text) => Text(text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ));

Widget iconText(IconData icon, Color iconColor, String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Icon(icon, color: iconColor),
        Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                )))
      ],
    ));

Widget plainText(String text) => Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
