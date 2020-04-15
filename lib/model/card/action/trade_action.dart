import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';
import 'card_action_details.dart';

class TradeAction extends CardAction {
  List<Resource> reward;

  TradeAction(description, List<Resource> cost, this.reward)
      : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
  }

  @override
  CardActionDetails get actionDetails =>
      CardActionDetails(cost, description, reward: reward);
}
