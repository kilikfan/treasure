import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class AnIsland extends Card {
  const AnIsland() : super("An Island?");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Pick up some crew.", [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW], soundEffect: "marching.mp3"),
      TradeAction("Kidnap some natives.", [Resource.CREW],
          [Resource.LANDLUBBER, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY], soundEffect: "kidnap.mp3"),
      DiscardAction(description: "Just a mirage.")
    ];
  }
}
