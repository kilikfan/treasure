import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class Mutiny extends Card {
  const Mutiny() : super("Mutiny!");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      //TODO - should be lose five resource cards at random
      ExileAction(cost: [Resource.CREW, Resource.DOUBLOON, Resource.FOOD, Resource.LANDLUBBER, Resource.INFAMY]),
      ExileAction(cost: [Resource.MAP, Resource.CREW, Resource.CREW, Resource.DOUBLOON]),
      ExileAction(cost: [Resource.MAP])
    ];
  }
}
