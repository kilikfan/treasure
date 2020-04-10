import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/trade_action.dart';
import '../card.dart';

class NewRecruits extends Card {
    const NewRecruits() : super("New Recruits");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Train some men.",[Resource.LANDLUBBER, Resource.LANDLUBBER], [Resource.CREW, Resource.CREW]),
      TradeAction("Steal a crew.", [], [Resource.CREW, Resource.CREW, Resource.INFAMY, Resource.INFAMY]),
      TradeAction("Steal a map.", [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW]),
    ];
  }
}
