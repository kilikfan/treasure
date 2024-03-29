import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/random_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/special_card_types.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../special_card.dart';

class Mutiny extends SpecialCard {
  const Mutiny() : super('Mutiny!', SpecialType.MUTINY);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      ExileAction(
          description: 'Devastation in the melee!',
          cost: RandomCost(5),
          soundEffect: SFX_SWORD),
      ExileAction(
          description: 'Pay off the mutineers to leave your crew.',
          cost: const SimpleCost([
            Resource.CREW,
            Resource.CREW,
            Resource.DOUBLOON,
            Resource.DOUBLOON
          ]),
          soundEffect: SFX_COINS),
      ExileAction(
          description: 'Share your map with the crew.',
          cost: const SimpleCost([Resource.MAP]),
          soundEffect: SFX_MAP)
    ];
  }
}
