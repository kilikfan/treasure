import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart' as Model;

import './card_action_cost.dart';
import './card_action_reward.dart';
import './card_action_text.dart';

class CardAction extends StatelessWidget {
  final Model.CardAction action;

  CardAction(this.action);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 0.33,
      height: (MediaQuery.of(context).size.width) * 0.33 * 1.3,
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: CardActionText(action.description)
            ),
            Expanded(
              flex: 3,
              child: CardActionCost(action.cost),
            ),
            Expanded(
              flex: 3,
              child: CardActionReward(),
            ),
          ],
        ),
      )
    );
  }
}