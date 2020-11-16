import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card_types.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/special/mutiny.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_display.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_pile.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should display the ScryPage if there are cards being scryed', (WidgetTester tester) async {
    final state = makeGameState();
    state.scryCards(1);

    await tester.pumpWidget(createWidgetForTesting(child: PlayPage('New Game', state)));

    expect(find.byType(ScryingPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);
  });

  testWidgets('should display the regular page if no cards being scryed', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();

    await tester.pumpWidget(createWidgetForTesting(child: PlayPage('New Game', state)));

    expect(find.byType(ScryingPage), findsNothing);
    expect(find.byType(PlayerHand), findsOneWidget);
  });

  testWidgets('should change colour based on the card type displayed', (WidgetTester tester) async {
    var cardFinder = find.byType(Card);

    await tester.pumpWidget(createWidgetForTesting(child: CardDisplay(makeGameState(), PlunderAWreck())));
    final basicCard = tester.widget<Card>(cardFinder);
    expect(basicCard.color, basicCardColour);

    await tester.pumpWidget(createWidgetForTesting(child: CardDisplay(makeGameState(), RumoursOfAnIsland())));
    final questCard = tester.widget<Card>(cardFinder);
    expect(questCard.color, questCardColour);

    await tester.pumpWidget(createWidgetForTesting(child: CardDisplay(makeGameState(), Mutiny())));
    final specialCard = tester.widget<Card>(cardFinder);
    expect(specialCard.color, specialCardColour);
  });

  testWidgets('should display correct count in deck and discard piles', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();
    state.nextCard();

    await tester.pumpWidget(createWidgetForTesting(child: PlayPage('New Game', state)));

    final deckFinder = find.widgetWithText(CardPile, 'Deck: ' + state.deck.length.toString());
    final discardFinder = find.widgetWithText(CardPile, 'Discard: ' + state.discard.length.toString());

    expect(deckFinder, findsOneWidget);
    expect(discardFinder, findsOneWidget);
  });
}
