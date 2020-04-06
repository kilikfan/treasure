import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'card_action.dart';

class TradeAction extends CardAction {
  List<Resource> reward;

  TradeAction(description, List<Resource> cost, this.reward) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
  }
}