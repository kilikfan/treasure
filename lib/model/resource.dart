import 'package:flutter/material.dart';

enum Resource { MAP, CREW, LANDLUBBER, FOOD, DOUBLOON, INFAMY }

extension ResourceExt on Resource {
  String getText() {
    switch (this) {
      case Resource.CREW:
        return 'C';
      case Resource.DOUBLOON:
        return 'D';
      case Resource.FOOD:
        return 'F';
      case Resource.INFAMY:
        return 'I';
      case Resource.LANDLUBBER:
        return 'L';
      case Resource.MAP:
        return 'M';
      default:
        return '';
    }
  }

  Color? getColour() {
    switch (this) {
      case Resource.CREW:
        return Colors.green[200];
      case Resource.DOUBLOON:
        return Colors.red[200];
      case Resource.FOOD:
        return Colors.blue[200];
      case Resource.INFAMY:
        return Colors.orange[200];
      case Resource.LANDLUBBER:
        return Colors.yellow[200];
      case Resource.MAP:
        return Colors.purple[200];
      default:
        return Colors.grey[200];
    }
  }
}
