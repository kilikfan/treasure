import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'card_action.dart';

class DiscardAction implements CardAction {
  @override
  final String description;

  @override
  List<Resource> get cost => new List<Resource>();

  DiscardAction([this.description="Discard this card."]);

  @override
  void performAction(GameState state) {
    // do nothing
  }
}