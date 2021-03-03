import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/discard_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../quest_card.dart';
import 'hispaniola_3_bribe_the_port.dart';

class LandAhoy extends QuestCard {
  const LandAhoy() : super("Land Ahoy!", QuestLine.HISPANIOLA, 2);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(description: "Still finding a quiet cove."),
      ReplaceAction(BribeThePort(), ReplaceType.FORWARDS, "Prepare to dock.",
          cost: [Resource.FOOD], soundEffect: SFX_SHIP_BELL),
      ExileAction(
          description: "Snag some new recruits.",
          reward: [Resource.CREW, Resource.CREW],
          soundEffect: SFX_MARCHING)
    ];
  }
}
