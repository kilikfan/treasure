import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart'
    as Model;
import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import './card_action_text.dart';
import 'card_action_line.dart';

class CardActionPanel extends StatelessWidget {
  final Model.CardAction action;
  final GameState state;

  CardActionPanel(this.action, this.state);

  @override
  Widget build(BuildContext context) {
    final actionDetails = action?.actionDetails;
    final enabled = action?.isEnabled(state) ?? false;

    return SizedBox(
      height: (MediaQuery.of(context).size.width / 3) * 1.4,
      child: RaisedButton(
          onPressed: enabled
              ? () {
                  action?.performAction(state);
                }
              : null,
          color: _getButtonColor(actionDetails),
          child: _getActionComponents(actionDetails)),
    );
  }

  Column _getActionComponents(CardActionDetails actionDetails) {
    if (actionDetails == null) {
      return null;
    }

    final list = <Widget>[
      Expanded(flex: 6, child: CardActionText(actionDetails.description))
    ];

    if (actionDetails.cost.isNotEmpty) {
      final description = '${actionDetails.cost.map((res) => res.getText())}';
      list.add(CardActionLine(description, Icons.arrow_downward, Colors.red));
    }

    if (actionDetails.reward.isNotEmpty) {
      final description = '${actionDetails.reward.map((res) => res.getText())}';
      list.add(CardActionLine(description, Icons.arrow_upward, Colors.green));
    }

    if (actionDetails.cardsToScry != null) {
      list.add(CardActionLine("Scry ${actionDetails.cardsToScry}", Icons.remove_red_eye, Colors.blue));
    }

    if (actionDetails.replacement != null) {
      list.add(CardActionLine("${actionDetails.replacement.name}", Icons.description, Colors.purpleAccent));
    }

    if (actionDetails.destination == CardDestination.DISCARD) {
      list.add(Expanded(flex: 6, child: CardActionLine("Discard", Icons.replay, Colors.black)));
    } else {
      list.add(Expanded(flex: 6, child: CardActionLine("Exile", Icons.delete, Colors.black)));
    }

    return Column(children: list);
  }

  Color _getButtonColor(CardActionDetails actionDetails) {
    final result = actionDetails?.result;
    switch (result) {
      case GameResult.WIN:
        return Colors.green[50];
      case GameResult.LOSE:
        return Colors.red[50];
      default:
        return Colors.yellow[50];
    }
  }
}
