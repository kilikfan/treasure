import 'card/card.dart';
import 'resource.dart';

class GameState {
  Card _currentCard;
  List<Card> _deck;
  List<Card> _discard = new List<Card>();
  List<Card> _exile = new List<Card>();

  List<Resource> _playerHand = new List<Resource>();

  GameState(this._deck) {
    _deck.shuffle();
    nextCard();
  }

  void nextCard() {
    if (_deck.isEmpty) {
      _deck.addAll(_discard);
      _discard.clear();
      _deck.shuffle();
    }

    if (_currentCard != null) {
      _discard.add(_currentCard);
    }

    _currentCard = _deck.removeAt(0);
  }

  void exileCurrentCard() {
    _exile.add(_currentCard);
    _currentCard = null;
  }

  void addResources(List<Resource> resources) {
    _playerHand.addAll(resources);
  }
}