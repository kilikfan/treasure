import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../quest_card.dart';
import 'into_the_depths_2_shoally_you_cant_be_serious.dart';
import 'into_the_depths_4_utopia.dart';

class KrakenInMyBoots extends QuestCard {
  const KrakenInMyBoots()
      : super('Kraken in My Boots', QuestLine.INTO_THE_DEPTHS, 3);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(
          cost: const SimpleCost([Resource.FOOD]),
          description: 'You satiate its hunger. For now.'),
      ReplaceAction(
          const ShoallyYouCantBeSerious(), ReplaceType.BACKWARDS, 'AAAARRGGH!',
          soundEffect: SFX_KRAKEN),
      //TODO - final crew can be C/L. Also need the flip a coin bit
      ReplaceAction(
          const Utopia(), ReplaceType.FORWARDS, 'What could she be guarding?',
          cost: [Resource.CREW, Resource.CREW, Resource.CREW])
    ];
  }
}
