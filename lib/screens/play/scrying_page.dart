import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';
import '../../model/card/card.dart' as Model;

import 'current_card/card_display.dart';

class ScryingPage extends StatelessWidget {
  final GameState state;

  ScryingPage(this.state);

  @override
  Widget build(BuildContext context) {
    List<Widget> scryingCards = state.scrying.map((card) {
      return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: MediaQuery.of(context).size.height * 0.6,
                child: CardDisplay(state, card)),
            _getScryButton(context, card, ScryOption.TOP),
            _getScryButton(context, card, ScryOption.BOTTOM)
          ]));
    }).toList();

    return ListView(scrollDirection: Axis.horizontal, children: scryingCards);
  }

  Widget _getScryButton(
      BuildContext context, Model.Card card, ScryOption scryOption) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            state.replaceScryedCard(card, scryOption);
          },
          color: scryOption.getColour(),
          child:
              Text(scryOption.getDescription(), style: TextStyle(fontSize: 30)),
        ));
  }
}
