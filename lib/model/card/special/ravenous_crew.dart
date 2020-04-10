import '../../resource.dart';
import '../action/card_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class RavenousCrew extends Card {
  const RavenousCrew() : super("Ravenous Crew");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - add string descriptions to ExileAction - "Theft is the only way."
      ExileAction([Resource.FOOD, Resource.INFAMY]),
      //TODO - add string descriptions to ExileAction - "Resort to cannibalism."
      //TODO - add payment for ExileAction - Resource.LANDLUBBER
      ExileAction([Resource.FOOD]),
      //TODO - add string descriptions to ExileAction - "Emergency port stop."
      //TODO - add payment for ExileAction - Resource.DOUBLOON
      ExileAction([Resource.FOOD])
    ];
  }
}
