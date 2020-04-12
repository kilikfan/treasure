import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../card.dart';
import 'hispaniola_2_land_ahoy.dart';

class RumoursOfAnIsland extends Card {
  const RumoursOfAnIsland() : super("Rumours of an Island");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      DiscardAction(),
      ReplaceAction(LandAhoy()),
      ExileAction([Resource.MAP])
    ];
  }
}
