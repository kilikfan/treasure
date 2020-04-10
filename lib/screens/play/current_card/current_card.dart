import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/card.dart' as GameCard;

import './card_action.dart';

class CurrentCard extends StatelessWidget {
  final GameCard.Card currentCard;

  CurrentCard(this.currentCard);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(currentCard.name),
          for (var action in currentCard.getActions()) CardAction(action)
        ],
      ),
    );
  }
}
