import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../resource.dart';
import 'action/discard_action.dart';
import 'action/trade_action.dart';
import 'card.dart';

class ARivalShip implements Card {
  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Board the ship.", [Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY]),
      DiscardAction("Turn away."),
      TradeAction("Open fire.", [
        Resource.CREW,
        Resource.CREW
      ], [
        Resource.DOUBLOON,
        Resource.LANDLUBBER,
        Resource.INFAMY,
        Resource.INFAMY
      ])
    ];
  }

  @override
  String get name => "A Rival Ship";
}
