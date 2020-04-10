import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class Scurvy extends Card {
  const Scurvy() : super("Scurvy!");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Oranges all round!", [Resource.FOOD, Resource.FOOD], []),
      //TODO - action should be half of crew owned
      TradeAction("Weevils too! Lose half your crew (round up) if one or more.", [Resource.CREW], []),
      //TODO - action should not be enabled unless it's the only available action
      DiscardAction("Find port to see a doctor (if no crew).")
    ];
  }
}
