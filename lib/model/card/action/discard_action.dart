import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';

import '../../../model/game_state.dart';
import '../../resource.dart';
import 'card_action.dart';

class DiscardAction extends CardAction {
  DiscardAction({String description="Discard this card.", List<Resource> cost = const []}) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    // do nothing
  }

  @override
  CardActionDetails get actionDetails => CardActionDetails(cost, description);
}