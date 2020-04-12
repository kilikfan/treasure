import '../../resource.dart';
import '../action/card_action.dart';
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
      DiscardAction(description: "Sidestep fate this time.")
    ];
  }
}
