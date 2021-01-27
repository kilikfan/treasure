import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class ExperienceAtTheWheel extends Card {
  const ExperienceAtTheWheel() : super("Experience at the Wheel");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction("Recruitment drive.", [], [Resource.CREW], soundEffect: "marching.mp3"),
      TradeAction("Packed extra supplies.", [], [Resource.FOOD], soundEffect: "apple_bite.wav"),
      TradeAction("A lucrative day of 'trading'.", [], [Resource.DOUBLOON], soundEffect: "coins.wav")
    ];
  }
}
