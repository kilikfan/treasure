import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';

import '../../game_result.dart';
import '../../resource.dart';
import '../card.dart';

class RetrieveTheHispaniolanTreasure extends Card {
  const RetrieveTheHispaniolanTreasure() : super("Retrieve the Hispaniolan Treasure");

  @override
  List<CardAction> getActions() {
    return [
      EndGameAction(GameResult.WIN, [Resource.MAP]),
      EndGameAction(GameResult.WIN, [Resource.CREW, Resource.CREW, Resource.CREW, Resource.DOUBLOON, Resource.DOUBLOON]),
      EndGameAction(GameResult.LOSE, [])
    ];
  }
}