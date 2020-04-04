import 'Card.dart';
import 'Resource.dart';

class GameState {
  Card currentCard;
  List<Card> deck;
  List<Card> discard = new List<Card>();
  List<Card> exile = new List<Card>();

  List<Resource> playerHand = new List<Resource>();

  GameState(this.deck) {
    deck.shuffle();
    nextCard();
  }

  void nextCard() {
    if (deck.isEmpty) {
      deck.addAll(discard);
      discard.clear();
      deck.shuffle();
    }

    currentCard = deck.removeAt(0);
  }
}