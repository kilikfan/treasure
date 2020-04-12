import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class NewRecruits extends Card {
    const NewRecruits() : super("New Recruits");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Train some men.",[Resource.LANDLUBBER, Resource.LANDLUBBER], [Resource.CREW, Resource.CREW]),
      TradeAction("Steal a crew.", [], [Resource.CREW, Resource.CREW, Resource.INFAMY, Resource.INFAMY]),
      TradeAction("Buy a crew.", [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW]),
    ];
  }
}
