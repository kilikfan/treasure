import 'package:treasure_of_the_high_seas/model/game_result.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../action/end_game_action.dart';
import '../card.dart';

class NavyRaid extends Card {
  const NavyRaid() : super("Navy Raid!");

  @override
  List<CardAction> getActions(GameState state) {
    final infamyCount = state.playerHand.countResource(Resource.INFAMY);
    final infamyCost = (infamyCount / 2).ceil();

    final infamies = List.generate(infamyCost, (int _) => Resource.INFAMY );
    final crews = List.generate(infamyCost - 1, (int _) => Resource.CREW);
    final doubloons = List.generate(infamyCost, (int _) => Resource.DOUBLOON);

    return [
      ExileAction(description: "A manner of conscription.", cost: infamies + crews),
      ExileAction(description: "A manner of taxation.", cost: infamies + doubloons),
      EndGameAction(GameResult.LOSE, [], "No manners, just capital punishment.")
    ];
  }
}
