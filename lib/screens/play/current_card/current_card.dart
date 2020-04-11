import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/card.dart' as GameCard;

import './card_actions/card_actions.dart';
import './card_header.dart';

class CurrentCard extends StatelessWidget {
  final GameCard.Card currentCard;

  CurrentCard(this.currentCard);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(currentCard.name),
        CardActions(currentCard.getActions())
      ],
    );
  }
}
