import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../card.dart';
import 'into_the_depths_1_a_sense_of_porpoise.dart';
import 'into_the_depths_3_kraken_in_my_boots.dart';

class ShoallyYouCantBeSerious extends Card {
  const ShoallyYouCantBeSerious() : super("Shoally You Can't Be Serious!");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      DiscardAction(cost: [Resource.FOOD]),
      //TODO - optional C/L C/L cost
      ReplaceAction(KrakenInMyBoots(), "???", [Resource.CREW, Resource.CREW, Resource.FOOD]),
      ReplaceAction(ASenseOfPorpoise(), "???")
    ];
  }
}
