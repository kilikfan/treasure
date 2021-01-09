import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'card_pile.dart';

class DeckStatePanel extends StatelessWidget {
  final GameState state;

  DeckStatePanel(this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CardPile(state.deck.length, 'Deck', state),
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
        CardPile(state.discard.length, 'Discard', state)
      ],
    );
  }
}
