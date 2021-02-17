import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';
import '../card_types.dart';

class Utopia extends Card {
  const Utopia()
      : super("Utopia",
            type: CardType.QUEST,
            questLine: QuestLine.INTO_THE_DEPTHS,
            questStage: 4);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      EndGameAction(GameResult.WIN, [Resource.MAP], "Behold its majesty!"),
      EndGameAction(
          GameResult.WIN,
          [
            Resource.CREW,
            Resource.CREW,
            Resource.CREW,
            Resource.FOOD,
            Resource.FOOD
          ],
          "'S alright."),
      EndGameAction(GameResult.LOSE, [], "Didn't quite escape the Kraken.",
          soundEffect: SFX_KRAKEN)
    ];
  }
}
