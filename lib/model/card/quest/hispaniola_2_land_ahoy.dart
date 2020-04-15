import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/discard_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../card.dart';
import 'hispaniola_3_bribe_the_port.dart';

class LandAhoy extends Card {
  const LandAhoy() : super("Land Ahoy!");

  @override
  List<CardAction> getActions() {
    return [
      DiscardAction(description: "Hold fast."),
      ReplaceAction(BribeThePort(), "Head in to port.", [Resource.FOOD]),
      ExileAction(description: "Snag some new recruits.", reward: [Resource.CREW, Resource.CREW])
    ];
  }
}
