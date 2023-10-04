import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/credits_page.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/menu_button.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/rules_page.dart';
import 'package:treasure_of_the_high_seas/screens/settings_page.dart';

import '../../model/audio/audio_model_test.mocks.dart';
import '../../test_utils.dart';

void main() {
  testWidgets('should navigate to the Rules page', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.launchWidget(child: MainMenuPage());

    final rulesButtonFinder = find.widgetWithText(MenuButton, 'Rules');
    await tester.tap(rulesButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(RulesPage), findsOneWidget);
  });

  testWidgets('should navigate to the Settings page',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.launchWidget(child: MainMenuPage());

    final settingsButtonFinder = find.widgetWithText(MenuButton, 'Settings');
    await tester.tap(settingsButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(SettingsPage), findsOneWidget);
  });

  testWidgets('should navigate to the Credits page',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.launchWidget(child: MainMenuPage());

    final creditsButtonFinder = find.widgetWithText(MenuButton, 'Credits');
    await tester.tap(creditsButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(CreditsPage), findsOneWidget);
  });

  testWidgets('should start a new game', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.launchWidget(child: MainMenuPage());

    final newGameFinder = find.widgetWithText(MenuButton, 'Play');
    await tester.tap(newGameFinder);
    await tester.pumpAndSettle();

    expect(find.byType(PlayPage), findsOneWidget);

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;
    expect(gameState.playerHand.cards, INITIAL_RESOURCES);
    expect(gameState.currentCard, isNotNull);
  });

  testWidgets('should play game music when launching a new game',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final audioModel = MockAudioModel();
    await tester.launchWidget(child: MainMenuPage(), audioModel: audioModel);

    final newGameFinder = find.widgetWithText(MenuButton, 'Play');
    await tester.tap(newGameFinder);
    await tester.pumpAndSettle();

    verify(audioModel.loopMusic(GAME_MUSIC));
  });
}
