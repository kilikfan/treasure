import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ExperienceAtTheWheel extends Card {
  const ExperienceAtTheWheel() : super("Experience at the Wheel");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Recruitment drive.", [], [Resource.CREW]),
      TradeAction("Packed extra supplies.", [], [Resource.FOOD]),
      TradeAction("A lucrative day of 'trading'.", [], [Resource.DOUBLOON])
    ];
  }
}
