import 'package:treasure_of_the_high_seas/model/card/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart';
import 'package:treasure_of_the_high_seas/model/card/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

GameState makeGameState(
    {List<Card> deck,
    ListShuffler shuffler = const ListShuffler(),
    List<Resource> playerHand = const []}) {
  final deckToUse = deck != null ? deck : [PlunderAWreck(), ARivalShip()];
  final state = GameState(shuffler, deckToUse);
  state.playerHand.addResources(playerHand);
  return state;
}
