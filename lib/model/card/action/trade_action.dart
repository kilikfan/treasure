import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'card_action.dart';

class TradeAction implements CardAction {
  @override
  final String description;

  @override
  List<Resource> cost;
  List<Resource> reward;

  TradeAction(this.description, this.cost, this.reward);

  @override
  void performAction(GameState state) {
    state.addResources(reward);
  }
}