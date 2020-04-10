import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import '../mocks.dart';
import '../test_utils.dart';

void main() {


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
    expect(state.deck, []);

    verifyNever(shuffler.shuffle(any));

    state.nextCard();
    verify(shuffler.shuffle(state.deck));

    expect(state.currentCard, plunderAWreck);
    expect(state.discard, []);
    expect(state.deck, [aRivalShip]);
  });

  test('should exile the current card', () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();
    final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip]);

    state.nextCard();
    state.exileCurrentCard();

    expect(state.exile, [plunderAWreck]);
    expect(state.currentCard, null);
  });
}
