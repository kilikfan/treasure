import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class PortFees extends Card {
  const PortFees() : super('Port Fees');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Pay the fee.', [Resource.DOUBLOON, Resource.DOUBLOON], [],
          soundEffect: SFX_COINS),
      TradeAction('Sail off.', [], [Resource.INFAMY],
          soundEffect: SFX_SHIP_BELL),
      TradeAction('Kidnap the clerk and sail off.', [],
          [Resource.LANDLUBBER, Resource.INFAMY],
          soundEffect: SFX_SHIP_BELL)
    ];
  }
}
