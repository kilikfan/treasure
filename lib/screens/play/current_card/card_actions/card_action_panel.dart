import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart' as Model;

import './card_action_cost.dart';
import './card_action_reward.dart';
import './card_action_text.dart';

class CardActionPanel extends StatelessWidget {
  final Model.CardAction action;

  CardActionPanel(this.action);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.width / 3) * 1.4,
      child: Card(
        color: Colors.yellow[50],
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: CardActionText(action?.description ?? '')
            ),
            Expanded(
              flex: 3,
              child: CardActionCost(action?.cost ?? []),
            ),
            Expanded(
              flex: 3,
              child: CardActionReward(),
            ),
          ],
        ),
      ),
    );
  }
}