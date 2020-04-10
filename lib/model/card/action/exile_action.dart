import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';

class ExileAction extends CardAction {
  final List<Resource> reward;

  ExileAction([this.reward = const []]) : super([], "Exile this card.");

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
    state.exileCurrentCard();
  }
}