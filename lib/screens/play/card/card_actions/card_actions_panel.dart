import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import '../../../../model/card/card.dart' as Model;
import './card_action_panel.dart';

class CardActionsPanel extends StatelessWidget {
  final Model.Card card;
  final bool readOnly;

  const CardActionsPanel(this.card, this.readOnly);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();
    final actions = card.getActions(state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        // Using .asMap() to help check if the list contains index before accessing that index
        // https://stackoverflow.com/questions/59762997/flutter-check-if-an-index-exists-in-list
        children: [
          CardActionPanel(
              actions.asMap().containsKey(0) ? actions[0] : null, readOnly: readOnly),
          CardActionPanel(
              actions.asMap().containsKey(1) ? actions[1] : null, readOnly: readOnly),
          CardActionPanel(
              actions.asMap().containsKey(2) ? actions[2] : null, readOnly: readOnly),
        ]);
  }
}
