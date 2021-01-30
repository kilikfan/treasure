import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_pile.dart';
import 'package:treasure_of_the_high_seas/screens/play/view_discard_page.dart';

import '../../../test_utils.dart';

void main() {
  testWidgets('clicking discard pile when discard is empty should do nothing', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(0, 'Discard', state), state: state);
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, false);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ViewDiscardPage), findsNothing);
  });

  testWidgets('clicking discard pile when discard has cards in should toggle discard view', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(5, 'Discard', state), state: state);
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, true);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ViewDiscardPage), findsOneWidget);
  });

  testWidgets('clicking deck pile should do nothing', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(5, 'Deck', state), state: state);
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, false);
  });
}