import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ARivalShip extends Card {
  const ARivalShip() : super('A Rival Ship');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Board the ship.', [Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY], soundEffect: SFX_SWORD),
      DiscardAction(description: 'Turn away.', soundEffect: SFX_SHIP_BELL),
      TradeAction('Open fire.', [Resource.CREW, Resource.CREW],
          [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY], soundEffect: SFX_CANNON)
    ];
  }
}
