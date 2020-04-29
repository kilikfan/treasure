import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';
import '../card_types.dart';

class Utopia extends Card {
  const Utopia() : super("Utopia", type: CardType.QUEST);

  @override
  List<CardAction> getActions() {
    return [
      EndGameAction(GameResult.WIN, [Resource.MAP], "Behold its majesty!"),
      EndGameAction(GameResult.WIN, [Resource.CREW, Resource.CREW, Resource.CREW, Resource.FOOD, Resource.FOOD],
        "'S alright."),
      EndGameAction(GameResult.LOSE, [], "Didn't quite escape the Kraken.")
    ];
  }
}
