import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import '../card.dart';
import 'card_action.dart';
import 'card_action_details.dart';

class ReplaceAction extends CardAction {
  Card replacementCard;

  ReplaceAction(this.replacementCard, [List<Resource> cost = const []])
      : super(cost,
            "Exile this card. Place '${replacementCard.name}' into the discard pile.");

  @override
  void performActionImpl(GameState state) {
    state.exileCurrentCard();
    state.discard.add(replacementCard);
  }

  @override
  CardActionDetails get actionDetails =>
      CardActionDetails(cost, this.description,
          replacement: this.replacementCard,
          destination: CardDestination.EXILE);
}
