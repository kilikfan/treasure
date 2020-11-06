import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../game_result.dart';
import 'card_action.dart';

class EndGameAction extends CardAction {
  final GameResult result;

  EndGameAction(this.result, List<Resource> cost, description) : super(SimpleCost(cost), description);

  @override
  void performActionImpl(GameState state) {
    state.result = this.result;
    state.endGame();
  }

  @override
  CardActionDetails get actionDetails => CardActionDetails(cost, description, result: result);

  @override
  bool autoProgress() => false;
}