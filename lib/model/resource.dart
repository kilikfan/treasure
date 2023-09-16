import 'package:flutter/material.dart';

enum Resource { MAP, CREW, LANDLUBBER, FOOD, DOUBLOON, INFAMY }

extension ResourceExt on Resource {
  String getText() {
    switch (this) {
      case Resource.CREW:
        return 'C';
        break;
      case Resource.DOUBLOON:
        return 'D';
        break;
      case Resource.FOOD:
        return 'F';
        break;
      case Resource.INFAMY:
        return 'I';
        break;
      case Resource.LANDLUBBER:
        return 'L';
        break;
      case Resource.MAP:
        return 'M';
        break;
      default:
        return '';
    }
  }

  Color? getColour() {
    switch (this) {
      case Resource.CREW:
        return Colors.green[200];
        break;
      case Resource.DOUBLOON:
        return Colors.red[200];
        break;
      case Resource.FOOD:
        return Colors.blue[200];
        break;
      case Resource.INFAMY:
        return Colors.orange[200];
        break;
      case Resource.LANDLUBBER:
        return Colors.yellow[200];
        break;
      case Resource.MAP:
        return Colors.purple[200];
        break;
      default:
        return Colors.grey[200];
    }
  }
}
