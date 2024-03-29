import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../special_card.dart';
import '../special_card_types.dart';

class RavenousCrew extends SpecialCard {
  const RavenousCrew() : super('Ravenous Crew', SpecialType.RAVENOUS_CREW);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      ExileAction(
          description: 'Theft is the only way.',
          reward: [Resource.FOOD, Resource.INFAMY],
          soundEffect: SFX_APPLE),
      ExileAction(
          description: 'Resort to cannibalism.',
          reward: [Resource.FOOD],
          cost: const SimpleCost([Resource.LANDLUBBER]),
          soundEffect: SFX_DEATH),
      ExileAction(
          description: 'Emergency port stop.',
          reward: [Resource.FOOD],
          cost: const SimpleCost([Resource.DOUBLOON]),
          soundEffect: SFX_COINS)
    ];
  }
}
