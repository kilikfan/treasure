import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';

import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../card.dart';
import 'into_the_depths_2_shoally_you_cant_be_serious.dart';

class ASenseOfPorpoise extends Card {
  const ASenseOfPorpoise() : super("A Sense of Porpoise");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      DiscardAction(),
      ReplaceAction(ShoallyYouCantBeSerious()),
      ExileAction(reward: [Resource.CREW, Resource.CREW])
    ];
  }
}