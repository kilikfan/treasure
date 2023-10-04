import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/card/card_types.dart';

import './card_actions/card_actions_panel.dart';
import './card_header.dart';
import '../../../model/card/card.dart' as Model;

class CardDisplay extends StatelessWidget {
  final Model.Card? card;
  final bool readOnly;

  const CardDisplay(this.card, {this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          color: _getCardColor(card!),
          child: ListView(
            children: [
              CardHeader(card!.name, card!.getSubHeaderText()),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CardActionsPanel(card, readOnly))
            ],
          ),
        ));
  }

  Color? _getCardColor(Model.Card card) {
    switch (card.type) {
      case CardType.QUEST:
        return questCardColour;
      case CardType.SPECIAL:
        return specialCardColour;
      default:
        return basicCardColour;
    }
  }
}
