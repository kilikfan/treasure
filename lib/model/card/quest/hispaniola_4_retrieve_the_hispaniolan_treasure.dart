import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';

import '../../game_result.dart';
import '../../game_state.dart';
import '../../resource.dart';
import '../card.dart';
import '../card_types.dart';

class RetrieveTheHispaniolanTreasure extends Card {
  const RetrieveTheHispaniolanTreasure() : super("Retrieve the Hispaniolan Treasure", type: CardType.QUEST);

  @override
  List<CardAction> getActions(GameState state) {
    return [
      EndGameAction(GameResult.WIN, [Resource.MAP], "X marks the spot!"),
      EndGameAction(GameResult.WIN, [Resource.CREW, Resource.CREW, Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON],
          "Very well buried, but we found it!"),
      EndGameAction(GameResult.LOSE, [], "Marooned by your crew!")
    ];
  }
}