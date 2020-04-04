import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import 'card/card.dart';
import 'resource.dart';

class GameState {
  final ListShuffler _shuffler;

  Card currentCard;
  List<Card> deck;
  List<Card> discard = new List<Card>();
  List<Card> exile = new List<Card>();

  List<Resource> playerHand = new List<Resource>();

  GameState(this._shuffler, this.deck);

  void nextCard() {
    if (currentCard != null) {
      discard.add(currentCard);
    }

    if (deck.isEmpty) {
      deck.addAll(discard);
      _shuffleDeck();
      discard.clear();
    }

    currentCard = deck.removeAt(0);
  }

  void _shuffleDeck () {
    _shuffler.shuffle(deck);
  }

  void exileCurrentCard() {
    exile.add(currentCard);
    currentCard = null;
  }

  void addResources(List<Resource> resources) {
    playerHand.addAll(resources);
    playerHand.sort((r1, r2) => r1.index.compareTo(r2.index));
  }
}