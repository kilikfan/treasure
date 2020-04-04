import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../resource.dart';
import 'action/trade_action.dart';
import 'card.dart';

class PlunderAWreck implements Card {
  @override
  String get name => "Plunder a Wreck";

  const PlunderAWreck();

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Treacherous seas indeed.", [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON]),
      TradeAction("Slim pickings.", [], [Resource.DOUBLOON]),
      TradeAction("Some Survivors.", [],
          [Resource.CREW, Resource.DOUBLOON, Resource.INFAMY])
    ];
  }
}
