import '../../resource.dart';
import '../action/card_action.dart';
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
      DiscardAction(description: "Saving yourself for a big dinner.")
    ];
  }
}
