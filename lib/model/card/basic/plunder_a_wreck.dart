import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class PlunderAWreck extends Card {
  const PlunderAWreck() : super("Plunder a Wreck");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Treacherous seas indeed.", [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON], soundEffect: "death_2.mp3"),
      TradeAction("Slim pickings.", [], [Resource.DOUBLOON], soundEffect: "coins.wav"),
      TradeAction("Some Survivors.", [],
          [Resource.CREW, Resource.DOUBLOON, Resource.INFAMY], soundEffect: "coins.wav")
    ];
  }
}
