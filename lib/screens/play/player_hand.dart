import 'package:flutter/material.dart';
import 'dart:math';

import 'package:treasure_of_the_high_seas/model/hand.dart';
import './resource_card.dart';

class PlayerHand extends StatelessWidget {
  final int maxCardsBeforeOverlapping = 7;
  final Hand hand;

  PlayerHand(this.hand);

  double _getCardXAlignment(int index) {
    return (2 / (max(hand.cards.length, maxCardsBeforeOverlapping) + 1)) * (index - ((hand.cards.length - 1) / 2));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> resourceCards = hand.cards.asMap().map((i, card) {
      
      return MapEntry(i, 
        Align(
          alignment: Alignment(_getCardXAlignment(i), _getCardXAlignment(i).abs()),
          child: SizedBox(
            width: (MediaQuery.of(context).size.width) / (maxCardsBeforeOverlapping + 2),
            height: ((MediaQuery.of(context).size.width) / (maxCardsBeforeOverlapping + 2)) * 1.4,
            child: ResourceCard(card)
          ),
        )
      );
    }).values.toList();

    return Stack(
      children: resourceCards
    );
  }
}
