import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/hand.dart';
import './resource_card.dart';

class PlayerHand extends StatelessWidget {
  final Hand hand;

  PlayerHand(this.hand);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var card in hand.cards) ResourceCard(card)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
