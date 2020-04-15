import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import './card_actions/card_actions_panel.dart';
import './card_header.dart';

class CurrentCardDisplay extends StatelessWidget {
  final GameState state;

  CurrentCardDisplay(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(state.currentCard.name),
        CardActionsPanel(state)
      ],
    );
  }
}
