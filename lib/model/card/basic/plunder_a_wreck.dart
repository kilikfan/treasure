import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class PlunderAWreck extends Card {
  const PlunderAWreck() : super('Plunder a Wreck');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Treacherous seas indeed.', [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON],
          soundEffect: SFX_DEATH),
      TradeAction('Slim pickings.', [], [Resource.DOUBLOON],
          soundEffect: SFX_COINS),
      TradeAction('Some Survivors.', [],
          [Resource.CREW, Resource.DOUBLOON, Resource.INFAMY],
          soundEffect: SFX_COINS)
    ];
  }
}
