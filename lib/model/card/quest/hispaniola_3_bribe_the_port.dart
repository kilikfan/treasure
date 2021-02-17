import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/discard_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../card.dart';
import '../card_types.dart';
import 'hispaniola_4_retrieve_the_hispaniolan_treasure.dart';

class BribeThePort extends Card {
  const BribeThePort()
      : super("Bribe the Port",
            type: CardType.QUEST,
            questLine: QuestLine.HISPANIOLA,
            questStage: 3);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(
          description: "Review the options over dinner.",
          cost: SimpleCost([Resource.FOOD, Resource.FOOD]),
          soundEffect: SFX_APPLE),
      ReplaceAction(RetrieveTheHispaniolanTreasure(), "A hefty fee to pay.",
          cost: [Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON],
          soundEffect: SFX_COINS),
      ExileAction(
          reward: [Resource.CREW, Resource.DOUBLOON, Resource.LANDLUBBER],
          description: "Too rich for our blood.")
    ];
  }
}
