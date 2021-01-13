import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'card_pile.dart';

class DeckStatePanel extends StatelessWidget {
  DeckStatePanel();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();
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
