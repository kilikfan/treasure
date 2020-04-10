import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class PlunderAWreck extends Card {
  const PlunderAWreck() : super("Plunder a Wreck");

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
