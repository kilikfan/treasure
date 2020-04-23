import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import './card_action_panel.dart';
import '../../../../model/card/card.dart' as Model;

class CardActionsPanel extends StatelessWidget {
  final GameState state;
  final Model.Card card;

  CardActionsPanel(this.state, this.card);

  @override
  Widget build(BuildContext context) {
    final actions = card.getActions();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        // Using .asMap() to help check if the list contains index before accessing that index
        // https://stackoverflow.com/questions/59762997/flutter-check-if-an-index-exists-in-list
          children: [
            Expanded(
              flex: 4,
              child: CardActionPanel(
                  actions.asMap().containsKey(0) ? actions[0] : null, state),
            ),
            Expanded(
              flex: 4,
              child: CardActionPanel(
                  actions.asMap().containsKey(1) ? actions[1] : null, state),
            ),
            Expanded(
              flex: 4,
              child: CardActionPanel(
                  actions.asMap().containsKey(2) ? actions[2] : null, state),
            ),
          ])
    );
  }
}
