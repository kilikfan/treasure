import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';

import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';

class ExileAction extends CardAction {
  final List<Resource> reward;

  ExileAction(
      {this.reward = const [],
      String description = "Exile this card.",
      List<Resource> cost = const []})
      : super(SimpleCost(cost), description);

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
    state.exileCurrentCard();
  }

  @override
  CardActionDetails get actionDetails => CardActionDetails(cost, description,
      reward: reward, destination: CardDestination.EXILE);
}
