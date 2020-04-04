import '../../game_state.dart';
import '../../resource.dart';

abstract class CardAction {
  final List<Resource> cost;
  final String description;

  CardAction(this.cost, this.description);

  void performAction(GameState state) {
    performActionImpl(state);
    state.nextCard();
  }

  void performActionImpl(GameState state);
}