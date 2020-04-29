import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../card.dart';
import '../card_types.dart';
import 'hispaniola_2_land_ahoy.dart';

class RumoursOfAnIsland extends Card {
  const RumoursOfAnIsland() : super("Rumours of an Island", type: CardType.QUEST);

  @override
  List<CardAction> getActions() {
    return [
      DiscardAction(description: "Maintain current course."),
      ReplaceAction(LandAhoy(), "Take a gamble and change course."),
      ExileAction(description: "Sail away, sail away.", reward: [Resource.MAP])
    ];
  }
}
