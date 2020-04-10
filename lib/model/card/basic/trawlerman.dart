import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class Trawlerman extends Card {
  const Trawlerman() : super("Trawlerman!");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Fresh fish.", [], [Resource.FOOD]),
      TradeAction("Fresh fish and fresh trawlerman!", [], [Resource.CREW, Resource.FOOD, Resource.INFAMY]),
      DiscardAction("Saving yourself for a big dinner.")
    ];
  }
}
