import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/trade_action.dart';
import '../card.dart';

class MeetingAnInformant extends Card {
  const MeetingAnInformant() : super("Meeting an Informant");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Would you like a map?", [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON],
          [Resource.MAP]),
      TradeAction("Keep him in your pocket.", [Resource.DOUBLOON], []),
      TradeAction("Do you really want to cross him?", [], [Resource.INFAMY, Resource.INFAMY])
    ];
  }
}
