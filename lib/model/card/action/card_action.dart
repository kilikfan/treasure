import 'package:meta/meta.dart';

import '../../game_state.dart';
import '../../resource.dart';

abstract class CardAction {
  final List<Resource> cost;
  final String description;

  CardAction(this.cost, this.description);

  bool isEnabled(GameState state) => state.playerHand.canAfford(cost);

  void performAction(GameState state) {
    state.playerHand.deductResources(cost);
    performActionImpl(state);
    state.nextCard();
  }

  @protected
  void performActionImpl(GameState state);
}