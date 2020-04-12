import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class CardActionCost extends StatelessWidget {
  final List<Resource> cost;

  CardActionCost(this.cost);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '(Cost not implemented...)',
        textAlign: TextAlign.center,
      ),
    );
  }
}