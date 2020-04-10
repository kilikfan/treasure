import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/trade_action.dart';
import '../card.dart';

class TavernBrawl extends Card {
    const TavernBrawl() : super("Tavern Brawl");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Pick over the aftermath.",[], [Resource.DOUBLOON]),
      TradeAction("Hold your corner.", [Resource.CREW], [Resource.DOUBLOON, Resource.LANDLUBBER, Resource.LANDLUBBER]),
      //TODO - one of the crew in the payment is a crew/landlubber
      TradeAction("Show them who's the captain!", [Resource.CREW, Resource.CREW, Resource.FOOD],
          [Resource.CREW, Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON]),
    ];
  }
}
