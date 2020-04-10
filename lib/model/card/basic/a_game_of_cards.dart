import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class AGameOfCards extends Card {
  const AGameOfCards() : super("A Game of Cards");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("A straight wins.", [Resource.CREW, Resource.DOUBLOON, Resource.FOOD, Resource.LANDLUBBER, Resource.INFAMY],
          [Resource.MAP]),
      TradeAction("Better luck next time.", [Resource.DOUBLOON, Resource.DOUBLOON], []),
      DiscardAction("Not worth the risk.")
    ];
  }
}
