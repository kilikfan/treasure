import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class TheFrenchFence extends Card {
  const TheFrenchFence() : super("The French Fence");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Sell your ill-gotten gains.",[], [Resource.DOUBLOON, Resource.DOUBLOON], soundEffect: "coins.wav"),
      // TODO - cost for "Buy a map" should be a choice between CREW and LANDLUBBER
      TradeAction("Buy a map.", [Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON], [Resource.MAP], soundEffect: "map.mp3"),
      TradeAction("Steal a map.", [Resource.CREW, Resource.CREW], [Resource.MAP, Resource.INFAMY], soundEffect: "map.mp3"),
    ];
  }
}
