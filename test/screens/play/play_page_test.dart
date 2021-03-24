import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_pile.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';
import 'package:treasure_of_the_high_seas/screens/quick_rules_page.dart';
import 'package:treasure_of_the_high_seas/screens/settings_page.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  testWidgets('should display the ScryPage if there are cards being scryed', (WidgetTester tester) async {
    final state = makeGameState();
    state.scryCards(1);

    await tester.launchWidget(child: PlayPage('New Game', state));

    expect(find.byType(ScryingPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);
  });

  testWidgets('should display the regular page if game is in progress with no cards being scryed', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();

    await tester.launchWidget(child: PlayPage('New Game', state));

    expect(find.byType(ScryingPage), findsNothing);
    expect(find.byType(GameEndPage), findsNothing);
    expect(find.byType(PlayerHand), findsOneWidget);
  });

  testWidgets('should display the game over page if the game result is a win', (WidgetTester tester) async {
    final state = makeGameState();
    state.endGame(GameResult.WIN);

    await tester.launchWidget(child: PlayPage('Play Page', state));

    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);
  });

  testWidgets('should display the game over page if the game result is a loss', (WidgetTester tester) async {
    final state = makeGameState();
    state.endGame(GameResult.LOSE);

    await tester.launchWidget(child: PlayPage('Play Page', state));

    expect(find.byType(GameEndPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);
  });

  testWidgets('should display correct count in deck and discard piles', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();
    state.nextCard();

    await tester.launchWidget(child: PlayPage('New Game', state));

    final deckFinder = find.widgetWithText(CardPile, 'Deck: ${state.deck.length}');
    final discardFinder = find.widgetWithText(CardPile, 'Discard: ${state.discard.length}');

    expect(deckFinder, findsOneWidget);
    expect(discardFinder, findsOneWidget);
  });

  testWidgets('should display the correct resource card count', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();

    await tester.launchWidget(child: PlayPage('New Game', state));

    final resourceCountFinder = find.widgetWithText(Align, 'Count: ${state.playerHand.cards.length}');

    expect(resourceCountFinder, findsOneWidget);
  });

  testWidgets('should play menu music when returning to menu', (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    await launchGameFromMenuMock(tester, audioModel: audioModel);

    await tester.pageBack();
    await tester.pumpAndSettle();

    verify(audioModel.loopMusic(MENU_MUSIC));
  });

  testWidgets('should launch the quick rules page', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();
    await tester.launchWidget(child: PlayPage('New Game', state));

    await tester.tap(find.byIcon(Icons.help));
    await tester.pumpAndSettle();

    final quickRulesPageFinder = find.byType(QuickRulesPage);
    final playPageFinder = find.byType(PlayPage);
    expect(quickRulesPageFinder, findsOneWidget);
    expect(playPageFinder, findsNothing);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(quickRulesPageFinder, findsNothing);
    expect(playPageFinder, findsOneWidget);
  });

  testWidgets('should launch the settings page', (WidgetTester tester) async {
    final state = makeGameState();
    state.nextCard();
    await tester.launchWidget(child: PlayPage('New Game', state));

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    final settingsFinder = find.byType(SettingsPage);
    final playPageFinder = find.byType(PlayPage);
    expect(settingsFinder, findsOneWidget);
    expect(playPageFinder, findsNothing);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(settingsFinder, findsNothing);
    expect(playPageFinder, findsOneWidget);
  });
}
