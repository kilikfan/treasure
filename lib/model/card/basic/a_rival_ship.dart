import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ARivalShip extends Card {
  const ARivalShip() : super("A Rival Ship");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Board the ship.", [Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY], soundEffect: "ship_bell.wav"),
      DiscardAction(description: "Turn away.", soundEffect: "rowing.mp3"),
      TradeAction("Open fire.", [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY], soundEffect: "cannon.mp3")
    ];
  }
}
