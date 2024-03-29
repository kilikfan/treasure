import 'package:treasure_of_the_high_seas/model/card/basic/basic_cards.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/quest_starters.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

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
  final deck = generateRandomDeck();
  final state = GameState(const Randomiser(), deck, INITIAL_RESOURCES);
  state.shuffleDeck();
  state.nextCard();
  return state;
}

List<Card> generateRandomDeck() {
  final deck = List<Card>.from(ALL_BASIC_CARDS);
  for (var quest in ALL_QUEST_STARTERS) {
    deck.add(quest);
  }
  return deck;
}
