import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../quest_card.dart';
import 'into_the_depths_1_a_sense_of_porpoise.dart';
import 'into_the_depths_3_kraken_in_my_boots.dart';

class ShoallyYouCantBeSerious extends QuestCard {
  const ShoallyYouCantBeSerious()
      : super("Shoally You Can't Be Serious!", QuestLine.INTO_THE_DEPTHS, 2);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(
          cost: SimpleCost([Resource.FOOD]),
          description: "The fishy smell persists."),
      //TODO - optional C/L C/L cost
      ReplaceAction(KrakenInMyBoots(), ReplaceType.FORWARDS,
          "You have an exi-stench-ial crisis.",
          cost: [Resource.CREW, Resource.CREW, Resource.FOOD]),
      ReplaceAction(ASenseOfPorpoise(), ReplaceType.BACKWARDS,
          "Why couldn’t it be follow the butterflies?")
    ];
  }
}
