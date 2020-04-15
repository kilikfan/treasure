import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';

class NavyRaid extends Card {
  const NavyRaid() : super("Navy Raid!");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      //TODO - should be pay half your Resource.INFAMY (rounded up) and one less Resource.CREW
      ExileAction(cost: [Resource.CREW, Resource.INFAMY, Resource.INFAMY]),
      //TODO - should be pay half your Resource.INFAMY (rounded up) and equal Resource.DOUBLOON
      ExileAction(cost: [Resource.FOOD, Resource.FOOD, Resource.INFAMY, Resource.INFAMY]),
      EndGameAction(GameResult.LOSE, [])
    ];
  }
}
