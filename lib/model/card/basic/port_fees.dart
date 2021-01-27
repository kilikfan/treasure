import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class PortFees extends Card {
  const PortFees() : super("Port Fees");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Pay the fee.", [Resource.DOUBLOON, Resource.DOUBLOON], [], soundEffect: "coins.wav"),
      TradeAction("Sail off.", [], [Resource.INFAMY], soundEffect: "rowing.mp3"),
      TradeAction("Kidnap the clerk and sail off.", [], [Resource.LANDLUBBER, Resource.INFAMY], soundEffect: "rowing.mp3")
    ];
  }
}
