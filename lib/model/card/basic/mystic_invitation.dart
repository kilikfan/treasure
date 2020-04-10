import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

import '../../resource.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class MysticInvitation extends Card {
  const MysticInvitation() : super("Mystic Invitation");

  @override
  List<CardAction> getActions() {
    return [
      TradeAction("Have your palm read.", [Resource.DOUBLOON], [Resource.CREW]),
      TradeAction("Participate in a seance.", [Resource.DOUBLOON, Resource.LANDLUBBER],
          [Resource.CREW, Resource.CREW, Resource.CREW]),
      DiscardAction("Sidestep fate this time.")
    ];
  }
}
