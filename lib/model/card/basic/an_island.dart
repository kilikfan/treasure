import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

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
      TradeAction("Pick up some crew.", [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW], soundEffect: SFX_MARCHING),
      TradeAction("Kidnap some natives.", [Resource.CREW],
          [Resource.LANDLUBBER, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY], soundEffect: SFX_KIDNAP),
      DiscardAction(description: "Just a mirage.")
    ];
  }
}
