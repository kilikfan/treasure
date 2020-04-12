import 'dart:math';

import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import 'card/card.dart';
import 'game_result.dart';
import 'hand.dart';

enum ScryOption {
  TOP,
  BOTTOM
}

class GameState {
  final ListShuffler _shuffler;

  Card currentCard;
  List<Card> deck;
  List<Card> discard = new List<Card>();
  List<Card> exile = new List<Card>();
  List<Card> scrying = new List<Card>();

  Hand playerHand = new Hand();

  GameResult result;

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

  void scryCards(int numToScry) {
    final actualNumToScry = min(deck.length, numToScry);
    scrying.addAll(deck.getRange(0, actualNumToScry));
    deck.removeRange(0, actualNumToScry);
  }

  void replaceScryedCard(Card card, ScryOption position) {
    scrying.remove(card);

    if (position == ScryOption.TOP) {
      deck.insert(0, card);
    } else {
      deck.add(card);
    }
  }

  void exileCurrentCard() {
    exile.add(currentCard);
    currentCard = null;
  }
}