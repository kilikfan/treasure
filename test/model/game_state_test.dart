import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/port_fees.dart';
import 'package:treasure_of_the_high_seas/model/card/special/special_cards.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';

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

    final MockRandomiser randomiser = MockRandomiser();
    logInvocations([randomiser]);

    final GameState state = makeGameState(deck: [plunderAWreck, aRivalShip], randomiser: randomiser);
    state.nextCard();
    state.nextCard();
    expect(state.deck, []);

    verifyNever(randomiser.shuffle(any));

    state.nextCard();
    verify(randomiser.shuffle(state.deck));

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

  group('Special cards', ()
  {
    test('should put Mutiny in next if too many resources', () {
      final GameState state = makeGameState(
          playerHand: [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
          Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
          Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
          Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON]
      );

      expect(state.nextCard(), new matcher.TypeMatcher<Mutiny>());
    });

    test('should not put Mutiny in next if resource count under 15', () {
      final GameState state = makeGameState(
          playerHand: [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.FOOD]
      );

      expect(state.nextCard(), new matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should put Navy Raid in next if too much infamy and coin true', () {
      final FakeRandomiser randomiser = FakeRandomiser(true);

      final GameState state = makeGameState(
          playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY, Resource.INFAMY,
            Resource.INFAMY, Resource.INFAMY, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON],
          randomiser: randomiser
      );

      expect(state.nextCard(), new matcher.TypeMatcher<NavyRaid>());
    });

    test('should not put Navy Raid in next if too much infamy and coin false', () {
      final FakeRandomiser randomiser = FakeRandomiser(false);

      final GameState state = makeGameState(
          playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY, Resource.INFAMY,
            Resource.INFAMY, Resource.INFAMY, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.FOOD],
        randomiser: randomiser
      );

      expect(state.nextCard(), new matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should not put Navy Raid in next if infamy under 4', () {
      final GameState state = makeGameState(
          playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.FOOD]
      );

      expect(state.nextCard(), new matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should put Ravenous Crew in next if no food', () {
      final GameState state = makeGameState(
          playerHand: [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON]
      );

      expect(state.nextCard(), new matcher.TypeMatcher<RavenousCrew>());
    });

    test('should not put Ravenous Crew in next if we have some food', () {
      final GameState state = makeGameState(
          playerHand: [Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON,
            Resource.DOUBLOON, Resource.DOUBLOON, Resource.DOUBLOON, Resource.FOOD]
      );

      expect(state.nextCard(), new matcher.TypeMatcher<PlunderAWreck>());
    });
  });

}
