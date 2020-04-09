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
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'TreasureHunt'
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.all(2),
    );
  }
}