import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class CardActionReward extends StatelessWidget {
  final List<Resource> reward;

  CardActionReward(this.reward);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${this.reward.map((res) => res.getText())}',
        textAlign: TextAlign.center,
      ),
    );
  }
}