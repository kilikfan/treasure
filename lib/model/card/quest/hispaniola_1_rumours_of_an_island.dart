import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/exile_action.dart';
import '../card.dart';

class RumoursOfAnIsland extends Card {
  const RumoursOfAnIsland() : super("Rumours of an Island");

  @override
  List<CardAction> getActions() {
    return [
      //TODO - flavour text required
      DiscardAction(""),
      //TODO - need an action to exile current card and add card x to discard pile
      ExileAction([]),
      ExileAction([Resource.MAP])
    ];
  }
}
