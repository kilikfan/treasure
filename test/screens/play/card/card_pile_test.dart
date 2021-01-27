import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/view_mode.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_pile.dart';

import '../../../test_utils.dart';

void main() {
  testWidgets('clicking discard pile when discard is empty should do nothing', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(0, 'Discard'));
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, false);

    await tester.tap(buttonFinder);
    expect(state.viewMode, ViewMode.NORMAL);
  });

  testWidgets('clicking discard pile when discard has cards in should toggle discard view', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(5, 'Discard'), state: state);
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, true);

    await tester.tap(buttonFinder);
    expect(state.viewMode, ViewMode.DISCARD);
  });

  testWidgets('clicking deck pile should do nothing', (WidgetTester tester) async {
    final buttonFinder = find.byType(TextButton);
    GameState state = makeGameState();

    await tester.launchWidget(child: CardPile(5, 'Deck'));
    final button = tester.widget<TextButton>(buttonFinder);
    expect(button.enabled, false);

    await tester.tap(buttonFinder);
    expect(state.viewMode, ViewMode.NORMAL);
  });
}