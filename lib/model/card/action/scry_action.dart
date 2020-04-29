import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';

import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import 'card_action.dart';
import 'card_action_details.dart';

class ScryAction extends CardAction {
  int numToScry;

  ScryAction(String description, List<Resource> cost, this.numToScry) : super(SimpleCost(cost), description);

  @override
  void performActionImpl(GameState state) {
    state.scryCards(numToScry);
  }

  @override
  CardActionDetails get actionDetails =>
      CardActionDetails(cost, description,
          cardsToScry: numToScry);

  @override
  bool autoProgress() => false;
}