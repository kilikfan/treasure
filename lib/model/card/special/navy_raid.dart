import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';
import '../card_types.dart';

class NavyRaid extends Card {
  const NavyRaid() : super("Navy Raid!", type: CardType.SPECIAL);

  @override
  List<CardAction> getActions() {
    return [
      //TODO - should be pay half your Resource.INFAMY (rounded up) and one less Resource.CREW
      ExileAction(description: "A manner of conscription.", cost: [Resource.CREW, Resource.INFAMY, Resource.INFAMY]),
      //TODO - should be pay half your Resource.INFAMY (rounded up) and equal Resource.DOUBLOON
      ExileAction(description: "A manner of taxation.", cost: [Resource.FOOD, Resource.FOOD, Resource.INFAMY, Resource.INFAMY]),
      EndGameAction(GameResult.LOSE, [], "No manners, just capital punishment.")
    ];
  }
}
