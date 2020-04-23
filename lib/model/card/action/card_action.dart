import 'package:meta/meta.dart';

import '../../game_state.dart';
import '../../resource.dart';
import 'card_action_details.dart';

abstract class CardAction {
  final List<Resource> cost;
  final String description;

  CardAction(this.cost, this.description);

  bool isEnabled(GameState state) => state.playerHand.canAfford(cost);

  CardActionDetails get actionDetails;

  void performAction(GameState state) {
    state.playerHand.deductResources(cost);
    performActionImpl(state);
    if (state.result == null) {
      state.nextCard();
    }
  }

  @protected
  void performActionImpl(GameState state);
}