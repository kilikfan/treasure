import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';
import 'package:treasure_of_the_high_seas/model/special_triggers.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

import 'card/card.dart';
import 'game_result.dart';
import 'hand.dart';

class GameState with ChangeNotifier {
  final Randomiser randomiser;

  Card currentCard;
  List<Card> deck;
  List<Card> discard = new List<Card>();
  List<Card> exile = new List<Card>();
  List<Card> scrying = new List<Card>();

  Hand playerHand = new Hand();

  GameResult result;

  GameState(this.randomiser, this.deck, [List<Resource> initialResources]) {
    playerHand.addResources(initialResources);
  }

  Card nextCard() {
    if (currentCard != null) {
      discard.add(currentCard);
    }

    // Check special card conditions
    addSpecialTopCardToDeck(this);

    if (deck.isEmpty) {
      deck.addAll(discard);
      shuffleDeck();
      discard.clear();
    }

    currentCard = deck.removeAt(0);
    notifyListeners();
    return currentCard;
  }

  void shuffleDeck() {
    randomiser.shuffle(deck);
  }

  void scryCards(int numToScry) {
    final actualNumToScry = min(deck.length, numToScry);
    scrying.addAll(deck.getRange(0, actualNumToScry));
    deck.removeRange(0, actualNumToScry);
    notifyListeners();
  }

  void replaceScryedCard(Card card, ScryOption position) {
    scrying.remove(card);

    if (position == ScryOption.TOP) {
      deck.insert(0, card);
    } else {
      deck.add(card);
    }

    notifyListeners();
  }

  void exileCurrentCard() {
    exile.add(currentCard);
    currentCard = null;

    notifyListeners();
  }
}