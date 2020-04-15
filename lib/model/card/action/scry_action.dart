import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';
import 'card_action_details.dart';

class ScryAction extends CardAction {
  int numToScry;

  ScryAction(String description, List<Resource> cost, this.numToScry) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.scryCards(numToScry);
  }

  @override
  CardActionDetails get actionDetails =>
      CardActionDetails(cost, description,
          cardsToScry: numToScry);
}