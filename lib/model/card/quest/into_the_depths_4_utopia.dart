import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';

class Utopia extends Card {
  const Utopia() : super("Utopia");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      EndGameAction(GameResult.WIN, [Resource.MAP]),
      EndGameAction(GameResult.WIN, [Resource.CREW, Resource.CREW, Resource.CREW, Resource.FOOD, Resource.FOOD]),
      EndGameAction(GameResult.LOSE, [])
    ];
  }
}
