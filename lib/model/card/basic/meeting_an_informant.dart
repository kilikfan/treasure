import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class MeetingAnInformant extends Card {
  const MeetingAnInformant() : super("Meeting an Informant");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Would you like a map?", [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON],
          [Resource.MAP], soundEffect: "map.mp3"),
      TradeAction("Keep him in your pocket.", [Resource.DOUBLOON], [], soundEffect: "coins.wav"),
      TradeAction("Do you really want to cross him?", [], [Resource.INFAMY, Resource.INFAMY])
    ];
  }
}
