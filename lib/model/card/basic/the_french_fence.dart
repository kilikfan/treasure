import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class TheFrenchFence extends Card {
  const TheFrenchFence() : super('The French Fence');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Sell your ill-gotten gains.',[], [Resource.DOUBLOON, Resource.DOUBLOON], soundEffect: SFX_COINS),
      // TODO - cost for 'Buy a map' should be a choice between CREW and LANDLUBBER
      TradeAction('Buy a map.', [Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON], [Resource.MAP], soundEffect: SFX_MAP),
      TradeAction('Steal a map.', [Resource.CREW, Resource.CREW], [Resource.MAP, Resource.INFAMY], soundEffect: SFX_MAP),
    ];
  }
}
