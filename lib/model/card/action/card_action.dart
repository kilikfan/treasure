import 'package:meta/meta.dart';

import '../../game_state.dart';
import '../../resource.dart';
import 'card_action_details.dart';

abstract class CardAction {
  final List<Resource> cost;
  final String description;

  bool enabled = true;

  CardAction(this.cost, this.description);

  bool isEnabled(GameState state) => state.playerHand.canAfford(cost) && enabled;

  CardActionDetails get actionDetails;

  void performAction(GameState state) {
    state.playerHand.deductResources(cost);
    performActionImpl(state);
    if (autoProgress()) {
      state.nextCard();
    }
  }

  @protected
  void performActionImpl(GameState state);

  bool autoProgress() => true;
}