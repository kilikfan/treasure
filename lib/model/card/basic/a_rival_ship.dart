import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ARivalShip extends Card {
  const ARivalShip() : super("A Rival Ship");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Board the ship.", [Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY]),
      DiscardAction(description: "Turn away."),
      TradeAction("Open fire.", [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY])
    ];
  }
}
