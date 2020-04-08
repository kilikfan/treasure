import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  ResourceCard(this.resource);

  String _getResourceText() {
    switch (resource) {
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

  Color _getResourceColor() {
    switch (resource) {
      case Resource.CREW: 
        return Colors.green;
        break;
      case Resource.DOUBLOON:
        return Colors.red;
        break;
      case Resource.FOOD:
        return Colors.blue;
        break;
      case Resource.INFAMY:
        return Colors.orange;
        break;
      case Resource.LANDLUBBER:
        return Colors.yellow;
        break;
      case Resource.MAP:
        return Colors.purple;
        break;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getResourceColor(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Text(
            _getResourceText(),
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.all(2),
    );
  }
}