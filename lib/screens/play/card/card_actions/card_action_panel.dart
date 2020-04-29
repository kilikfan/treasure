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
  final bool readOnly;

  CardActionPanel(this.action, this.state, { this.readOnly = false });

  @override
  Widget build(BuildContext context) {
    final actionDetails = action?.actionDetails;
    final enabled = action?.isEnabled(state) ?? false;

    final shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    );

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: readOnly
            ? Card(
                shape: shape,
                color: _getButtonColor(actionDetails),
                child: _getActionComponents(actionDetails))
            : RaisedButton(
                shape: shape,
                onPressed: enabled
                    ? () {
                        action?.performAction(state);
                      }
                    : null,
                color: _getButtonColor(actionDetails),
                child: _getActionComponents(actionDetails)));
  }

  Column _getActionComponents(CardActionDetails actionDetails) {
    if (actionDetails == null) {
      return null;
    }

    final effects = <CardActionLine>[];

    if (!actionDetails.cost.isEmpty()) {
      effects
          .add(CardActionLine(actionDetails.cost.getDescription(), Icons.arrow_downward, Colors.red));
    }

    if (actionDetails.reward.isNotEmpty) {
      final description = '${actionDetails.reward.map((res) => res.getText())}';
      effects
          .add(CardActionLine(description, Icons.arrow_upward, Colors.green));
    }

    if (actionDetails.cardsToScry != null) {
      effects.add(CardActionLine("Scry ${actionDetails.cardsToScry}",
          Icons.remove_red_eye, Colors.blue));
    }

    if (actionDetails.replacement != null) {
      effects.add(CardActionLine("${actionDetails.replacement.name}",
          Icons.description, Colors.purpleAccent));
    }

    return Column(
      children: [
        SizedBox(height: 5),
        CardActionText(actionDetails.description),
        SizedBox(height: 10),
        Row(
          children: effects,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(height: 10),
        _getResultWidget(actionDetails),
        SizedBox(height: 5),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _getResultWidget(CardActionDetails actionDetails) {
    if (actionDetails.result == GameResult.WIN) {
      return CardActionLine("You Win!", Icons.check, Colors.green);
    } else if (actionDetails.result == GameResult.LOSE) {
      return CardActionLine("You Lose!", Icons.close, Colors.red);
    } else if (actionDetails.destination == CardDestination.DISCARD) {
      return CardActionLine("Discard", Icons.replay, Colors.black);
    } else {
      return CardActionLine("Exile", Icons.delete, Colors.black);
    }
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