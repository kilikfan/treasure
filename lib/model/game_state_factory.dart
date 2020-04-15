import 'package:treasure_of_the_high_seas/model/card/basic/basic_cards.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import 'card/card.dart';
import 'game_state.dart';

const INITIAL_RESOURCES = [
  Resource.CREW,
  Resource.CREW,
  Resource.LANDLUBBER,
  Resource.LANDLUBBER,
  Resource.FOOD,
  Resource.FOOD,
  Resource.DOUBLOON,
  Resource.DOUBLOON,
];

GameState startNewGame() {
  final List<Card> deck = generateRandomDeck();
  final GameState state = new GameState(new ListShuffler(), deck, INITIAL_RESOURCES);
  state.shuffleDeck();
  state.nextCard();
  return state;
}

List<Card> generateRandomDeck() {
  final deck = List<Card>.from(ALL_BASIC_CARDS);
  deck.add(RumoursOfAnIsland());
  return deck;
}