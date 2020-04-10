import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ExperienceAtTheWheel extends Card {
  const ExperienceAtTheWheel() : super("Experience at the Wheel");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Recruitment drive.", [], [Resource.CREW]),
      TradeAction("Packed extra supplies.", [], [Resource.FOOD]),
      TradeAction("A lucrative day of .", [], [Resource.DOUBLOON])
    ];
  }
}
