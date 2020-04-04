import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart';
import 'package:treasure_of_the_high_seas/model/card/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import '../mocks.dart';

void main() {
  GameState makeGameState(
      {List<Card> deck,
        ListShuffler shuffler = const ListShuffler()}) {

    final deckToUse = deck != null ? deck : [PlunderAWreck(), ARivalShip()];
    return GameState(shuffler, deckToUse);
  }

  test('should add resources to the players hand and sort it by resource', () {
    final GameState state = makeGameState();

    state.addResources([Resource.CREW, Resource.DOUBLOON, Resource.CREW]);
    expect(state.playerHand, [Resource.CREW, Resource.CREW, Resource.DOUBLOON]);

    state.addResources([Resource.CREW, Resource.MAP]);
    expect(state.playerHand, [Resource.MAP, Resource.CREW, Resource.CREW, Resource.CREW, Resource.DOUBLOON]);
  });

  test('should draw cards in order, placing the current card into the discard', () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();
    final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip]);

    state.nextCard();
    expect(state.currentCard, plunderAWreck);
    expect(state.discard, []);
    expect(state.deck, [aRivalShip]);

    state.nextCard();
    expect(state.currentCard, aRivalShip);
    expect(state.discard, [plunderAWreck]);
    expect(state.deck, []);
  });

  test('should shuffle the discard pile and draw from it if the deck is empty', () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();

    final MockListShuffler shuffler = MockListShuffler();
    logInvocations([shuffler]);

    final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip], shuffler: shuffler);
    state.nextCard();
    state.nextCard();
    expect(state.deckSize(), 0);

    verifyNever(shuffler.shuffle(any));

    state.nextCard();
    verify(shuffler.shuffle(state.deck));

    expect(state.currentCard, plunderAWreck);
    expect(state.discard, []);
    expect(state.deck, [aRivalShip]);
  });
}
