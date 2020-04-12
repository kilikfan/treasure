import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import '../card.dart';
import 'card_action.dart';

class ReplaceAction extends CardAction {
  Card replacementCard;

  ReplaceAction(this.replacementCard, [List<Resource> cost = const []]) : super(cost, "Exile this card. Place '${replacementCard.name}' into the discard pile.");

  @override
  void performActionImpl(GameState state) {
    state.exileCurrentCard();
    state.discard.add(replacementCard);
  }
}