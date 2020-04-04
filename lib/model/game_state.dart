import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import 'card/card.dart';
import 'resource.dart';

class GameState {
  final ListShuffler _shuffler;

  Card _currentCard;
  List<Card> _deck;
  List<Card> _discard = new List<Card>();
  List<Card> _exile = new List<Card>();

  List<Resource> _playerHand = new List<Resource>();

  GameState(this._shuffler, this._deck) {
    _deck.shuffle();
    nextCard();
  }

  void nextCard() {
    if (_deck.isEmpty) {
      _deck.addAll(_discard);
      _discard.clear();
      _shuffler.shuffle(_deck);
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