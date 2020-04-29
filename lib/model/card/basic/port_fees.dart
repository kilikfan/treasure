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
      TradeAction("Pay the fee.", [Resource.DOUBLOON, Resource.DOUBLOON], []),
      TradeAction("Sail off.", [], [Resource.INFAMY]),
      TradeAction("Kidnap the clerk and sail off.", [], [Resource.LANDLUBBER, Resource.INFAMY])
    ];
  }
}
