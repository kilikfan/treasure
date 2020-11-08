import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card_types.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/special/mutiny.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_display.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should display the ScryPage if there are cards being scryed', (WidgetTester tester) async {
    //ugly hack to set a stupid size, so this test doesn't complain about random overflows
    tester.binding.window.physicalSizeTestValue = Size(2000, 1920);

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

  testWidgets('should display the game over page with correct text if we have a game result', (WidgetTester tester) async {
    final state = makeGameState();

    //Test for a win
    state.endGame(GameResult.WIN);
    await tester.pumpWidget(createWidgetForTesting(child: PlayPage('Play Page', state)));
    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final gameWinTextFinder = find.text(GameResult.WIN.description);
    expect(gameWinTextFinder, findsOneWidget);

    final button1Finder = find.text('New Game');
    final button2Finder = find.text('Exit');
    expect(button1Finder, findsOneWidget);
    expect(button2Finder, findsOneWidget);

    //Test for a loss
    state.endGame(GameResult.LOSE);
    await tester.pumpWidget(createWidgetForTesting(child: PlayPage('Play Page', state)));
    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final gameLoseTextFinder = find.text(GameResult.LOSE.description);
    expect(gameLoseTextFinder, findsOneWidget);

    final button3Finder = find.text('New Game');
    final button4Finder = find.text('Exit');
    expect(button3Finder, findsOneWidget);
    expect(button4Finder, findsOneWidget);
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
}
