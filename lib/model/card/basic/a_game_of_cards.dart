import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class AGameOfCards extends Card {
  const AGameOfCards() : super("A Game of Cards");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("A straight wins.", [Resource.CREW, Resource.DOUBLOON, Resource.FOOD, Resource.LANDLUBBER, Resource.INFAMY],
          [Resource.MAP], soundEffect: "poker_chips.wav"),
      TradeAction("Better luck next time.", [Resource.DOUBLOON, Resource.DOUBLOON], [], soundEffect: "coins.wav"),
      DiscardAction(description: "Not worth the risk.")
    ];
  }
}
