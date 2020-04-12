import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart' as Model;

import './card_action.dart';

class CardActions extends StatelessWidget {
  final List<Model.CardAction> actions;

  CardActions(this.actions);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      // Using .asMap() to help check if the list contains index before accessing that index
      // https://stackoverflow.com/questions/59762997/flutter-check-if-an-index-exists-in-list
      children: [
        Expanded(
          flex: 4,
          child: CardAction(
            actions.asMap().containsKey(0) ? actions[0] : null
          ),
        ),
        Expanded(
          flex: 4,
          child: CardAction(
            actions.asMap().containsKey(1) ? actions[1] : null
          ),
        ),
        Expanded(
          flex: 4,
          child: CardAction(
            actions.asMap().containsKey(2) ? actions[2] : null
          ),
        ), 
      ]
    );
  }
}