import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card_types.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/special/mutiny.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_display.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should display the ScryPage if there are cards being scryed',
      (WidgetTester tester) async {
    //ugly hack to set a stupid size, so this test doesn't complain about random overflows
    tester.binding.window.physicalSizeTestValue = Size(2000, 1920);

    final state = makeGameState();
    state.scryCards(1);

    await tester
        .pumpWidget(createWidgetForTesting(child: PlayPage('New Game', state)));

    expect(find.byType(ScryingPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);
  });

  testWidgets('should display the regular page if no cards being scryed',
      (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();

    await tester
        .pumpWidget(createWidgetForTesting(child: PlayPage('New Game', state)));

    expect(find.byType(ScryingPage), findsNothing);
    expect(find.byType(PlayerHand), findsOneWidget);
  });

  testWidgets('should change colour based on the card type displayed',
      (WidgetTester tester) async {
    const plunderAWreck = PlunderAWreck();
    const rumoursOfAnIsland = RumoursOfAnIsland();
    const mutiny = Mutiny();
    final GameState state =
        makeGameState(deck: [plunderAWreck, rumoursOfAnIsland, mutiny]);
    state.nextCard();

    await tester
        .pumpWidget(createWidgetForTesting(child: CardDisplay(state, state.currentCard)));

     var cardFinder = find.byType(Card);
     var card = tester.widget<Card>(cardFinder);

    //Test colour of basic card is yellow
    expect(card.color, basicCardColour);

    //Test colour of quest card pale purple
    state.nextCard();
    await tester
        .pumpWidget(createWidgetForTesting(child: CardDisplay(state, state.currentCard)));
    cardFinder = find.byType(Card);
    card = tester.widget<Card>(cardFinder);
    expect(card.color, questCardColour);

    //Test colour of special card pale red
    state.nextCard();
    await tester
        .pumpWidget(createWidgetForTesting(child: CardDisplay(state, state.currentCard)));
    cardFinder = find.byType(Card);
    card = tester.widget<Card>(cardFinder);
    expect(card.color, specialCardColour);
  });
}
