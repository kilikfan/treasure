import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart' as Model;
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import './card_action_cost.dart';
import './card_action_reward.dart';
import './card_action_text.dart';

class CardActionPanel extends StatelessWidget {
  final Model.CardAction action;
  final GameState state;

  CardActionPanel(this.action, this.state);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.width / 3) * 1.4,
      child: RaisedButton(
        onPressed: action?.isEnabled(state) ?? false ? () {
          action?.performAction(state);
        } : null,
        color: Colors.yellow[50],
        child: action == null ? null : Column(
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
      ),
    );
  }
}