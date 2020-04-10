import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';

class ScryAction extends CardAction {
  int numToScry;

  ScryAction(String description, List<Resource> cost, this.numToScry) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.scryCards(numToScry);
  }
}