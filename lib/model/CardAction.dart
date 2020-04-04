import 'GameState.dart';
import 'Resource.dart';

abstract class CardAction {
  final List<Resource> cost;

  CardAction(this.cost);

  void performAction(GameState state) {
    _performActionImpl(state);
    state.nextCard();
  }

  void _performActionImpl(GameState state);
}