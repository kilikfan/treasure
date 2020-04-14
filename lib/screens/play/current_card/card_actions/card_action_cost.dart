import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class CardActionCost extends StatelessWidget {
  final List<Resource> cost;

  CardActionCost(this.cost);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${this.cost.map((res) => res.getText())}',
        textAlign: TextAlign.center,
      ),
    );
  }
}