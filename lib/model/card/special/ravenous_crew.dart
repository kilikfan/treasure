import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class RavenousCrew extends Card {
  const RavenousCrew() : super("Ravenous Crew");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - add string descriptions to ExileAction - "Theft is the only way."
      ExileAction([Resource.FOOD, Resource.INFAMY]),
      //TODO - add string descriptions to ExileAction - "Better luck next time."
      //TODO - add payment for ExileAction - Resource.LANDLUBBER
      ExileAction([Resource.FOOD]),
      //TODO - add string descriptions to ExileAction - "Emergency port stop."
      //TODO - add payment for ExileAction - Resource.DOUBLOON
      ExileAction([Resource.FOOD])
    ];
  }
}
