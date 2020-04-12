import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

class CardActionReward extends StatelessWidget {
  final List<Resource> reward;

  CardActionReward([this.reward = const []]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '(Reward not implemented...)',
        textAlign: TextAlign.center,
      ),
    );
  }
}