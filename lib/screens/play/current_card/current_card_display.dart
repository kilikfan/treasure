import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/card.dart' as GameCard;

import './card_actions/card_actions_panel.dart';
import './card_header.dart';

class CurrentCardDisplay extends StatelessWidget {
  final GameCard.Card currentCard;

  CurrentCardDisplay(this.currentCard);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(currentCard.name),
        CardActionsPanel(currentCard.getActions())
      ],
    );
  }
}
