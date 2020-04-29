import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class Scurvy extends Card {
  const Scurvy() : super("Scurvy!");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Oranges all round!", [Resource.FOOD, Resource.FOOD], []),
      //TODO - action should be half of crew owned
      TradeAction("Weevils too! Lose half your crew (round up) if one or more.", [Resource.CREW], []),
      //TODO - action should not be enabled unless it's the only available action
      DiscardAction(description: "Find port to see a doctor (if no crew).")
    ];
  }
}
