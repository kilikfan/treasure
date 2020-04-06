import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import 'card/card.dart';
import 'hand.dart';

class GameState {
  final ListShuffler _shuffler;

  Card currentCard;
  List<Card> deck;
  List<Card> discard = new List<Card>();
  List<Card> exile = new List<Card>();

  Hand playerHand = new Hand();

  GameState(this._shuffler, this.deck);

  Card nextCard() {
    if (currentCard != null) {
      discard.add(currentCard);
    }

    if (deck.isEmpty) {
      deck.addAll(discard);
      _shuffleDeck();
      discard.clear();
    }

    currentCard = deck.removeAt(0);
    return currentCard;
  }

  void _shuffleDeck () {
    _shuffler.shuffle(deck);
  }

  void exileCurrentCard() {
    exile.add(currentCard);
    currentCard = null;
  }
}