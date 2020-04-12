import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/discard_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../card.dart';
import 'hispaniola_4_retrieve_the_hispaniolan_treasure.dart';

class BribeThePort extends Card {
  const BribeThePort() : super("Bribe the Port");

  @override
  List<CardAction> getActions() {
    return [
      DiscardAction(cost: [Resource.FOOD, Resource.FOOD]),
      ReplaceAction(RetrieveTheHispaniolanTreasure(), [Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON]),
      ExileAction([Resource.CREW, Resource.DOUBLOON, Resource.LANDLUBBER])
    ];
  }
}