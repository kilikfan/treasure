import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../game_result.dart';
import 'card_action.dart';

class EndGameAction extends CardAction {
  final GameResult result;

  EndGameAction(this.result, List<Resource> cost) : super(cost, result.description);

  @override
  void performActionImpl(GameState state) {
    state.result = this.result;
  }
}