import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'card_action.dart';

class DiscardAction extends CardAction {
  DiscardAction([String description="Discard this card."]) : super([], description);

  @override
  void performActionImpl(GameState state) {
    // do nothing
  }
}