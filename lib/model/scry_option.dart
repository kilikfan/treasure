import 'package:flutter/material.dart';

enum ScryOption {
  TOP,
  BOTTOM
}

extension ScryOptionExt on ScryOption {
  Color getColour() {
    if (this == ScryOption.TOP) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  String getDescription() {
    if (this == ScryOption.TOP) {
      return 'Top';
    } else {
      return 'Bottom';
    }
  }
}