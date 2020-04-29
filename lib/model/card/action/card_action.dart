import 'package:meta/meta.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';

import '../../game_state.dart';
import 'card_action_details.dart';

abstract class CardAction {
  final CardActionCost cost;
  final String description;

  bool enabled = true;

  CardAction(this.cost, this.description);

  bool isEnabled(GameState state) => cost.isAffordable(state) && enabled;

  CardActionDetails get actionDetails;

  void performAction(GameState state) {
    cost.deductCost(state);
    performActionImpl(state);
    if (autoProgress()) {
      state.nextCard();
    }
  }

  @protected
  void performActionImpl(GameState state);

  bool autoProgress() => true;
}