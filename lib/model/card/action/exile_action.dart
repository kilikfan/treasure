import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';

class ExileAction extends CardAction {
  final List<Resource> reward;

  ExileAction({this.reward = const [], String description="Exile this card.", List<Resource> cost = const []}) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
    state.exileCurrentCard();
  }
}