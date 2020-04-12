import '../../../model/game_state.dart';
import '../../resource.dart';
import 'card_action.dart';

class DiscardAction extends CardAction {
  DiscardAction({String description="Discard this card.", List<Resource> cost = const []}) : super(cost, description);

  @override
  void performActionImpl(GameState state) {
    // do nothing
  }
}