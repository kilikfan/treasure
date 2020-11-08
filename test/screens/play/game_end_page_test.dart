import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should display correct text for win and loss', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: GameEndPage(GameResult.WIN)));

    var gameWinTextFinder = find.text(GameResult.WIN.description);
    var gameLoseTextFinder = find.text(GameResult.LOSE.description);
    expect(gameWinTextFinder, findsOneWidget);
    expect(gameLoseTextFinder, findsNothing);

    await tester.pumpWidget(createWidgetForTesting(child: GameEndPage(GameResult.LOSE)));

    gameWinTextFinder = find.text(GameResult.WIN.description);
    gameLoseTextFinder = find.text(GameResult.LOSE.description);
    expect(gameWinTextFinder, findsNothing);
    expect(gameLoseTextFinder, findsOneWidget);
  });

  testWidgets('new game button should start a new game', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: GameEndPage(GameResult.WIN)));

    final button1Finder = find.text('New Game');
    expect(button1Finder, findsOneWidget);

    await tester.tap(button1Finder);
    await tester.pumpAndSettle();

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;
    expect(gameState.result, null);
    expect(gameState.playerHand.cards, INITIAL_RESOURCES);
    expect(gameState.currentCard, isNotNull);
  });

  testWidgets('exit button should start exit to main menu', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MainMenuPage()));

    final button1Finder = find.text('Play');
    expect(button1Finder, findsOneWidget);
    await tester.tap(button1Finder);
    await tester.pumpAndSettle();

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;

    gameState.endGame(GameResult.LOSE);
    await tester.pumpAndSettle();
    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final button2Finder = find.text('Exit');
    expect(button2Finder, findsOneWidget);

    await tester.tap(button2Finder);
    await tester.pumpAndSettle();
    expect(find.byType(PlayerHand), findsNothing);
    expect(find.byType(MainMenuPage), findsOneWidget);
  });
}
