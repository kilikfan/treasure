import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  testWidgets('should display correct text for win and loss', (WidgetTester tester) async {
    await tester.launchWidget(child: GameEndPage(GameResult.WIN));

    var gameWinTextFinder = find.text(GameResult.WIN.description);
    var gameLoseTextFinder = find.text(GameResult.LOSE.description);
    expect(gameWinTextFinder, findsOneWidget);
    expect(gameLoseTextFinder, findsNothing);

    await tester.launchWidget(child: GameEndPage(GameResult.LOSE));

    gameWinTextFinder = find.text(GameResult.WIN.description);
    gameLoseTextFinder = find.text(GameResult.LOSE.description);
    expect(gameWinTextFinder, findsNothing);
    expect(gameLoseTextFinder, findsOneWidget);
  });

  testWidgets('new game button should start a new game', (WidgetTester tester) async {
    await tester.launchWidget(child: GameEndPage(GameResult.WIN));

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

  testWidgets('exit button should exit to main menu, and play menu music', (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    await launchGameFromMenu(tester, audioModel: audioModel);

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;

    gameState.endGame(GameResult.LOSE);
    await tester.pumpAndSettle();

    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final exitFinder = find.text('Exit');
    expect(exitFinder, findsOneWidget);

    await tester.tap(exitFinder);
    await tester.pumpAndSettle();
    expect(find.byType(PlayerHand), findsNothing);
    expect(find.byType(MainMenuPage), findsOneWidget);

    verify(audioModel.loopMusic(MENU_MUSIC));
  });
}
