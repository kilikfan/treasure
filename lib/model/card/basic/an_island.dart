import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class AnIsland extends Card {
  const AnIsland() : super("An Island?");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Pick up some crew.", [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW]),
      TradeAction("Kidnap some natives.", [Resource.CREW],
          [Resource.LANDLUBBER, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY]),
      DiscardAction("Just a mirage.")
    ];
  }
}
