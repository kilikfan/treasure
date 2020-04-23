import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
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
}
