import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import './card_actions/card_actions_panel.dart';
import './card_header.dart';
import '../../../model/card/card.dart' as Model;

class CardDisplay extends StatelessWidget {
  final GameState state;
  final Model.Card card;

  CardDisplay(this.state, this.card);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(card.name),
        CardActionsPanel(state, card)
      ],
    );
  }
}
