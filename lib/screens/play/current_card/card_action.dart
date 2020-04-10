import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart' as Model;

class CardAction extends StatelessWidget {
  final Model.CardAction action;

  CardAction(this.action);

  @override
  Widget build(BuildContext context) {
    return Text(action.description);
  }
}