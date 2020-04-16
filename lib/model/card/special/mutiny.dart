import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class Mutiny extends Card {
  const Mutiny() : super("Mutiny!");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - should be lose five resource cards at random
      ExileAction(description: "Devastation in the melee!",
          cost: [Resource.CREW, Resource.DOUBLOON, Resource.FOOD, Resource.LANDLUBBER, Resource.INFAMY]),
      ExileAction(description: "Pay off the mutineers to leave your crew.",
          cost: [Resource.CREW, Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON]),
      ExileAction(description: "Share your map with the crew.", cost: [Resource.MAP])
    ];
  }
}
