import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';

import '../../../model/game_state.dart';
import '../../../model/resource.dart';
import '../card.dart';
import 'card_action.dart';
import 'card_action_details.dart';

enum ReplaceType { FORWARDS, BACKWARDS }

class ReplaceAction extends CardAction {
  Card replacementCard;
  ReplaceType replaceType;

  ReplaceAction(this.replacementCard, this.replaceType, String description,
      {List<Resource> cost = const [], String? soundEffect})
      : super(SimpleCost(cost), description, soundEffect: soundEffect);

  @override
  void performActionImpl(GameState state) {
    state.exileCurrentCard();
    state.discard.add(replacementCard);
  }

  @override
  CardActionDetails get actionDetails =>
      CardActionDetails(cost, description,
          replacement: replacementCard,
          destination: CardDestination.EXILE,
          replaceType: replaceType);
}
