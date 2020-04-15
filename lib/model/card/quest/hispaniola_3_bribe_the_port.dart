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
      DiscardAction(description: "Pay the docking fee.", cost: [Resource.FOOD, Resource.FOOD]),
      ReplaceAction(RetrieveTheHispaniolanTreasure(), "Bribe the port.", [Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON]),
      ExileAction(reward: [Resource.CREW, Resource.DOUBLOON, Resource.LANDLUBBER])
    ];
  }
}