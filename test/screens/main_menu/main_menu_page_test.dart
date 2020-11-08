import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/menu_button.dart';
import 'package:treasure_of_the_high_seas/screens/play/rules.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should navigate to the Rules page', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: MainMenuPage()));

    final rulesButtonFinder = find.widgetWithText(MenuButton, 'Rules');
    expect(rulesButtonFinder, findsOneWidget);

    await tester.tap(rulesButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(RulesPage, skipOffstage: true), findsOneWidget);
  });
}
