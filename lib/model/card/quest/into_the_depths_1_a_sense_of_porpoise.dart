import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../quest_card.dart';
import 'into_the_depths_2_shoally_you_cant_be_serious.dart';

class ASenseOfPorpoise extends QuestCard {
  const ASenseOfPorpoise()
      : super('A Sense of Porpoise',
            QuestLine.INTO_THE_DEPTHS,
            1);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      DiscardAction(description: 'No bites yet.'),
      ReplaceAction(const ShoallyYouCantBeSerious(), ReplaceType.FORWARDS, 'Something smells fishy…'),
      ExileAction(
          reward: [Resource.CREW, Resource.CREW],
          description: 'The crew fancy steak instead.')
    ];
  }
}
