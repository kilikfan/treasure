import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../game_result.dart';
import '../../resource.dart';
import '../card.dart';

enum CardDestination { DISCARD, EXILE }

class CardActionDetails {
  final String description;
  final CardActionCost cost;
  final List<Resource> reward;
  final int cardsToScry;
  final GameResult result;
  final Card replacement;
  final CardDestination destination;
  final ReplaceType replaceType;

  const CardActionDetails(this.cost, this.description,
      {this.reward = const [],
      this.cardsToScry,
      this.result,
      this.replacement,
      this.destination = CardDestination.DISCARD,
      this.replaceType = ReplaceType.FORWARDS});
}
