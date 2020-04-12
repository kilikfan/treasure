import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/port_fees.dart';
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

  group('Scrying', () {
    test('should scry the specified number of cards', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      expect(state.scrying, [plunderAWreck, aRivalShip]);
      expect(state.deck, [portFees]);
    });

    test('should handle trying to scry more cards than there are remaining', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(4);

      expect(state.scrying, [plunderAWreck, aRivalShip, portFees]);
      expect(state.deck, []);
    });

    test('should be able to replace a scryed card on top of the deck', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      state.replaceScryedCard(plunderAWreck, ScryOption.TOP);

      expect(state.deck, [plunderAWreck, portFees]);
      expect(state.scrying, [aRivalShip]);
    });

    test('should be able to replace a scryed card on the bottom of the deck', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);


      state.replaceScryedCard(aRivalShip, ScryOption.BOTTOM);
      state.replaceScryedCard(plunderAWreck, ScryOption.BOTTOM);

      expect(state.deck, [portFees, aRivalShip, plunderAWreck]);
      expect(state.scrying, []);
    });
  });


}
