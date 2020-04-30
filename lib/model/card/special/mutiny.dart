import 'package:treasure_of_the_high_seas/model/card/action/random_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class Mutiny extends Card {
  const Mutiny() : super("Mutiny!");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      ExileAction(
          description: "Devastation in the melee!", cost: RandomCost(5)),
      ExileAction(
          description: "Pay off the mutineers to leave your crew.",
          cost: SimpleCost([
            Resource.CREW,
            Resource.CREW,
            Resource.DOUBLOON,
            Resource.DOUBLOON
          ])),
      ExileAction(
          description: "Share your map with the crew.",
          cost: SimpleCost([Resource.MAP]))
    ];
  }
}
