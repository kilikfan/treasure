import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'current_card/card_display.dart';

class ScryingPage extends StatelessWidget {
  final GameState state;

  ScryingPage(this.state);

  @override
  Widget build(BuildContext context) {
    List<Widget> scryingCards = state.scrying.map((card) {
      return Column(
        children: [
          CardDisplay(state, card),
          RaisedButton(
            onPressed: () {
              state.replaceScryedCard(card, ScryOption.TOP);
            },
            color: Theme.of(context).accentColor,
            child: Text(
                "Top",
                style: TextStyle(fontSize: 30)
            ),
          ),
          RaisedButton(
            onPressed: () {
              state.replaceScryedCard(card, ScryOption.BOTTOM);
            },
            color: Theme.of(context).accentColor,
            child: Text(
                "Bottom",
                style: TextStyle(fontSize: 30)
            ),
          )
        ]
      );
    }).toList();

    return ListView(scrollDirection: Axis.horizontal, children: scryingCards);
  }
}
