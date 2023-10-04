import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ExperienceAtTheWheel extends Card {
  const ExperienceAtTheWheel() : super('Experience at the Wheel');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Recruitment drive.', [], [Resource.CREW],
          soundEffect: SFX_MARCHING),
      TradeAction('Packed extra supplies.', [], [Resource.FOOD],
          soundEffect: SFX_APPLE),
      TradeAction('A lucrative day of "trading".', [], [Resource.DOUBLOON],
          soundEffect: SFX_COINS)
    ];
  }
}
