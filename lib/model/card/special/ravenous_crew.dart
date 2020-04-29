import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class RavenousCrew extends Card {
  const RavenousCrew() : super("Ravenous Crew");

  @override
  List<CardAction> getActions(GameState state) {
    return [
      ExileAction(description: "Theft is the only way.", reward: [Resource.FOOD, Resource.INFAMY]),
      ExileAction(description: "Resort to cannibalism.", reward: [Resource.FOOD], cost: [Resource.LANDLUBBER]),
      ExileAction(description: "Emergency port stop.", reward: [Resource.FOOD], cost: [Resource.DOUBLOON])
    ];
  }
}
