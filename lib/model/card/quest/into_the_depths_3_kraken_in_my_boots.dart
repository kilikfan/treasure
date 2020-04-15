import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../card.dart';
import 'into_the_depths_2_shoally_you_cant_be_serious.dart';
import 'into_the_depths_4_utopia.dart';

class KrakenInMyBoots extends Card {
  const KrakenInMyBoots() : super("Kraken in My Boots");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      DiscardAction(cost: [Resource.FOOD]),
      ReplaceAction(ShoallyYouCantBeSerious(), "???"),
      //TODO - final crew can be C/L. Also need the flip a coin bit
      ReplaceAction(Utopia(), "???", [Resource.CREW, Resource.CREW, Resource.CREW])
    ];
  }
}
