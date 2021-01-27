import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class DockingForSupplies extends Card {
  const DockingForSupplies() : super("Docking for Supplies");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Fresh food.", [Resource.DOUBLOON, Resource.DOUBLOON],
          [Resource.FOOD], soundEffect: "apple_bite.wav"),
      TradeAction("Honest trading.", [Resource.FOOD, Resource.FOOD], [Resource.DOUBLOON], soundEffect: "coins.wav"),
      DiscardAction(description: "Nothing to declare.")
    ];
  }
}
