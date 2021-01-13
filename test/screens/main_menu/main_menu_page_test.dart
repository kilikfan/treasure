import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/menu_button.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/rules_page.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should navigate to the Rules page', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MainMenuPage()));

    final rulesButtonFinder = find.widgetWithText(MenuButton, 'Rules');
    expect(rulesButtonFinder, findsOneWidget);

    await tester.tap(rulesButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(RulesPage), findsOneWidget);
  });

  testWidgets('should start a new game', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MainMenuPage()));

    final newGameFinder = find.widgetWithText(MenuButton, 'Play');
    expect(newGameFinder, findsOneWidget);

    await tester.tap(newGameFinder);
    await tester.pumpAndSettle();

    expect(find.byType(PlayPage), findsOneWidget);

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;
    expect(gameState.playerHand.cards, INITIAL_RESOURCES);
    expect(gameState.currentCard, isNotNull);
  });
}