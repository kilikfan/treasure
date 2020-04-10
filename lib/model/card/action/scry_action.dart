import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'card_action.dart';

class ScryAction extends CardAction {
  List<Resource> cost;
  int numToScry;

  ScryAction(description, List<Resource> cost, int numToScry) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    state.scryCards(numToScry);
  }
}