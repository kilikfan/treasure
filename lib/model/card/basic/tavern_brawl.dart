import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class TavernBrawl extends Card {
    const TavernBrawl() : super("Tavern Brawl");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Pick over the aftermath.",[], [Resource.DOUBLOON], soundEffect: SFX_COINS),
      TradeAction("Hold your corner.", [Resource.CREW], [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.LANDLUBBER], soundEffect: SFX_SWORD),
      //TODO - one of the crew in the payment is a crew/landlubber
      TradeAction("Show them who's the captain!", [Resource.CREW, Resource.CREW, Resource.FOOD],
          [Resource.CREW, Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON], soundEffect: SFX_SWORD),
    ];
  }
}
