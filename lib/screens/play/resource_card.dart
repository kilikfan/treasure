import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard(this.resource);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: resource.getColour(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Text(
            resource.getText(),
            style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'TreasureHunt'),
          ),
        ),
      ),
      margin: const EdgeInsets.all(2),
    );
  }
}
