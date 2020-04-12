import 'package:flutter_test/flutter_test.dart';

import 'package:treasure_of_the_high_seas/model/card/action/trade_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/discard_action.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/screens/play/current_card/card_actions/card_actions.dart';

import '../../../test_utils.dart';

void main() {
  testWidgets('should be able to display 2 card actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: CardActions([
          TradeAction('Test action 1', [Resource.DOUBLOON], [Resource.MAP]),
          DiscardAction('Test action 2')
        ]))
    );

    final action1Finder = find.text('Test action 1');
    final action2Finder = find.text('Test action 2');

    expect(action1Finder, findsOneWidget);
    expect(action2Finder, findsOneWidget);
  });

  testWidgets('should be able to display 3 card actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: CardActions([
          TradeAction('Test action 1', [Resource.CREW, Resource.DOUBLOON], [Resource.MAP]),
          TradeAction('Test action 2', [Resource.CREW], [Resource.FOOD]),
          DiscardAction('Test action 3')
        ]))
    );

    final action1Finder = find.text('Test action 1');
    final action2Finder = find.text('Test action 2');
    final action3Finder = find.text('Test action 3');

    expect(action1Finder, findsOneWidget);
    expect(action2Finder, findsOneWidget);
    expect(action3Finder, findsOneWidget);
  });
}
