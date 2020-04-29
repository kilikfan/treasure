import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import '../../resource.dart';

class SimpleCost extends CardActionCost {
  final List<Resource> cost;

  SimpleCost(this.cost);

  @override
  void deductCost(GameState state) {
    state.playerHand.deductResources(cost);
  }

  @override
  String getDescription() => "${cost.map((res) => res.getText())}";

  @override
  bool isAffordable(GameState state) => state.playerHand.canAfford(cost);

  @override
  bool isEmpty() => cost.isEmpty;
}
