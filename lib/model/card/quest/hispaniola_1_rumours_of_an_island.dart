import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../quest_card.dart';
import 'hispaniola_2_land_ahoy.dart';

class RumoursOfAnIsland extends QuestCard {
  const RumoursOfAnIsland()
      : super('Rumours of an Island', QuestLine.HISPANIOLA, 1);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(
          description: 'Maintain current course.', soundEffect: SFX_SHIP_BELL),
      ReplaceAction(const LandAhoy(), ReplaceType.FORWARDS,
          'Take a gamble and change course.',
          soundEffect: SFX_LAND_HO),
      ExileAction(
          description: 'Sail away, sail away.',
          reward: [Resource.MAP],
          soundEffect: SFX_MAP)
    ];
  }
}
