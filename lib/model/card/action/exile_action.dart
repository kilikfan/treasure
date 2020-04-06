import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

class ExileAction extends CardAction {
  final List<Resource> reward;

  ExileAction([this.reward = const []]) : super([], "Exile this card.");

  @override
  void performActionImpl(GameState state) {
    state.playerHand.addResources(reward);
    state.exileCurrentCard();
  }
}