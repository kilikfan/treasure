import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_game_of_cards.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/port_fees.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_2_land_ahoy.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/into_the_depths_1_a_sense_of_porpoise.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/into_the_depths_2_shoally_you_cant_be_serious.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/into_the_depths_3_kraken_in_my_boots.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/into_the_depths_4_utopia.dart';
import 'package:treasure_of_the_high_seas/model/card/special/special_cards.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';

import '../mocks.dart';
import '../test_utils.dart';

void main() {
  test('should draw cards in order, placing the current card into the discard',
      () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();
    final state = makeGameState(deck: [plunderAWreck, aRivalShip]);

    state.nextCard();
    expect(state.currentCard, plunderAWreck);
    expect(state.discard, []);
    expect(state.deck, [aRivalShip]);

    state.nextCard();
    expect(state.currentCard, aRivalShip);
    expect(state.discard, [plunderAWreck]);
    expect(state.deck, []);
  });

  test('should shuffle the discard pile and draw from it if the deck is empty',
      () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();

    final randomiser = MockRandomiser();
    logInvocations([randomiser]);

    final state = makeGameState(
        deck: [plunderAWreck, aRivalShip], randomiser: randomiser);
    state.nextCard();
    state.nextCard();
    expect(state.deck, []);

    verifyNever(randomiser.shuffle(state.deck));
    verifyNever(randomiser.shuffle(state.discard));

    state.nextCard();
    verify(randomiser.shuffle(state.deck));

    expect(state.currentCard, plunderAWreck);
    expect(state.discard, []);
    expect(state.deck, [aRivalShip]);
  });

  test('should exile the current card', () {
    const plunderAWreck = PlunderAWreck();
    const aRivalShip = ARivalShip();
    final state = makeGameState(deck: [plunderAWreck, aRivalShip]);

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
      final state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      expect(state.scrying, [plunderAWreck, aRivalShip]);
      expect(state.deck, [portFees]);
    });

    test('should handle trying to scry more cards than there are remaining',
        () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(4);

      expect(state.scrying, [plunderAWreck, aRivalShip, portFees]);
      expect(state.deck, []);
    });

    test('should be able to replace a scryed card on top of the deck', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      state.replaceScryedCard(plunderAWreck, ScryOption.TOP);

      expect(state.deck, [plunderAWreck, portFees]);
      expect(state.scrying, [aRivalShip]);
    });

    test('should be able to replace a scryed card on bottom of the deck', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      state.replaceScryedCard(plunderAWreck, ScryOption.BOTTOM);

      expect(state.deck, [portFees, plunderAWreck]);
      expect(state.scrying, [aRivalShip]);
    });

    test('should draw the next card after scrying is finished', () {
      const plunderAWreck = PlunderAWreck();
      const aRivalShip = ARivalShip();
      const portFees = PortFees();
      final state = makeGameState(deck: [plunderAWreck, aRivalShip, portFees]);

      state.scryCards(2);

      state.replaceScryedCard(aRivalShip, ScryOption.BOTTOM);
      state.replaceScryedCard(plunderAWreck, ScryOption.BOTTOM);

      expect(state.currentCard, portFees);
      expect(state.deck, [aRivalShip, plunderAWreck]);
      expect(state.scrying, []);
    });
  });

  group('Special cards', () {
    test('should put Mutiny in next if too many resources', () {
      final state = makeGameState(playerHand: [
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON
      ]);

      expect(state.nextCard(), const matcher.TypeMatcher<Mutiny>());
    });

    test('should not put Mutiny in next if resource count under 15', () {
      final state = makeGameState(playerHand: [
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.FOOD
      ]);

      expect(state.nextCard(), const matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should put Navy Raid in next if too much infamy and coin true', () {
      final randomiser = FakeRandomiser(true);

      final state = makeGameState(playerHand: [
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON
      ], randomiser: randomiser);

      expect(state.nextCard(), const matcher.TypeMatcher<NavyRaid>());
    });

    test('should not put Navy Raid in next if too much infamy and coin false',
        () {
      final randomiser = FakeRandomiser(false);

      final state = makeGameState(playerHand: [
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.FOOD
      ], randomiser: randomiser);

      expect(state.nextCard(), const matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should not put Navy Raid in next if infamy under 4', () {
      final state = makeGameState(playerHand: [
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.INFAMY,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.FOOD
      ]);

      expect(state.nextCard(), const matcher.TypeMatcher<PlunderAWreck>());
    });

    test('should put Ravenous Crew in next if no food', () {
      final state = makeGameState(playerHand: [
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON
      ]);

      expect(state.nextCard(), const matcher.TypeMatcher<RavenousCrew>());
    });

    test('should not put Ravenous Crew in next if we have some food', () {
      final state = makeGameState(playerHand: [
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.DOUBLOON,
        Resource.FOOD
      ]);

      expect(state.nextCard(), const matcher.TypeMatcher<PlunderAWreck>());
    });
  });

  group('ChangeNotifier', () {
    void _verifyChangeNotifier(GameState state, Function() stateFunction) {
      final fn = MockFunction().fn;
      state.addListener(fn);

      stateFunction();
      verify(fn());
    }

    test('state methods should notify listeners', () {
      final state = makeGameState();
      _verifyChangeNotifier(state, state.nextCard);
      _verifyChangeNotifier(state, () => state.scryCards(1));
      _verifyChangeNotifier(state,
          () => state.replaceScryedCard(const PlunderAWreck(), ScryOption.TOP));
      _verifyChangeNotifier(state, state.exileCurrentCard);
      _verifyChangeNotifier(state, () => state.endGame(GameResult.WIN));
    });
  });

  group('Getting active quests', () {
    test(
        'should return only quest cards from the current card, deck and discard pile',
        () {
      // basic cards:
      const aGameOfCards = AGameOfCards();
      const aRivalShip = ARivalShip();
      // quest cards: (note we have at most 2 active quests in reality, but this makes the test stricter)
      const rumoursOfAnIsland = RumoursOfAnIsland();
      const landAhoy = LandAhoy();
      const aSenseOfPorpoise = ASenseOfPorpoise();
      const krakenInMyBoots = KrakenInMyBoots();
      const shoallyYouCantBeSerious = ShoallyYouCantBeSerious();
      const utopia = Utopia();

      final state =
          makeGameState(deck: [aGameOfCards, landAhoy, aSenseOfPorpoise]);
      state.discard
          .addAll([aRivalShip, krakenInMyBoots, shoallyYouCantBeSerious]);
      state.currentCard = rumoursOfAnIsland;
      state.scrying.addAll(
          [utopia, aGameOfCards]); // shouldn't include quests from scrying

      final activeQuestCards = state.getActiveQuestCards();
      activeQuestCards.sort((card1, card2) => card1.name
          .compareTo(card2.name)); // sort so test doesn't care about order
      expect(activeQuestCards, [
        aSenseOfPorpoise,
        krakenInMyBoots,
        landAhoy,
        rumoursOfAnIsland,
        shoallyYouCantBeSerious
      ]);
    });
  });
}
