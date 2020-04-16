import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/scry_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/trade_action.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_2_land_ahoy.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/screens/play/current_card/card_actions/card_action_line.dart';
import 'package:treasure_of_the_high_seas/screens/play/current_card/card_actions/card_action_panel.dart';
import 'package:treasure_of_the_high_seas/screens/play/current_card/card_actions/card_action_text.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

class DummyAction extends CardAction {
  final bool enabled;
  final Function(Object) fn;

  DummyAction(List<Resource> cost, this.enabled, [this.fn])
      : super(cost, "Some Action");

  @override
  void performAction(GameState state) {
    if (fn != null) {
      fn(state);
    }
  }

  @override
  void performActionImpl(GameState state) {
    // do nothing
  }

  @override
  bool isEnabled(GameState state) {
    return enabled;
  }

  @override
  CardActionDetails get actionDetails => CardActionDetails(cost, description);
}

void main() {
  testWidgets('should display a blank, disabled button if not passed an action',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: CardActionPanel(null, makeGameState())));

    final textFinder = find.byElementType(CardActionText);
    final cardLineFinder = find.byElementType(CardActionLine);

    expect(textFinder, findsNothing);
    expect(cardLineFinder, findsNothing);

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.enabled, false);
  });

  testWidgets(
      'should display a disabled button if the action should not be enabled',
      (WidgetTester tester) async {
    final action = DummyAction([Resource.DOUBLOON], false);
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.enabled, false);

    final textFinder = find.text('Some Action');
    final costFinder = find.text('(D)');
    expect(textFinder, findsOneWidget);
    expect(costFinder, findsOneWidget);
  });

  testWidgets('should be enabled if appropriate, and call performAction on tap',
      (WidgetTester tester) async {
    final performAction = new MockFunction().fnOne;
    final state = makeGameState();
    final action = DummyAction([Resource.DOUBLOON], true, performAction);
    await tester.pumpWidget(
        createWidgetForTesting(child: CardActionPanel(action, state)));

    final buttonFinder = find.byType(RaisedButton);
    final button = tester.widget<RaisedButton>(buttonFinder);
    expect(button.enabled, true);

    final textFinder = find.text('Some Action');
    final costFinder = find.text('(D)');
    expect(textFinder, findsOneWidget);
    expect(costFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    verify(performAction(state));
  });

  testWidgets('should render a scry action', (WidgetTester tester) async {
    final action = ScryAction("See the future.", [Resource.FOOD], 3);
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    expect(find.text('See the future.'), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.text('Scry 3'), findsOneWidget);
  });

  testWidgets('should render a reward', (WidgetTester tester) async {
    final action =
        TradeAction("Buy some food", [Resource.DOUBLOON], [Resource.FOOD]);
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    expect(find.text('Buy some food'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    expect(find.text('(F)'), findsOneWidget);
  });

  testWidgets('should render a win action, and not display the Discard line', (WidgetTester tester) async {
    final action =
    EndGameAction(GameResult.WIN, [], "You Win!");
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    expect(find.text('You Win!'), findsWidgets);

    final buttonFinder = find.byType(RaisedButton);
    final button = tester.widget<RaisedButton>(buttonFinder);
    expect(button.color, Colors.green[50]);

    expect(find.text('Discard'), findsNothing);
  });

  testWidgets('should render a loss action, and not display the Discard line', (WidgetTester tester) async {
    final action =
    EndGameAction(GameResult.LOSE, [], "You Lose!");
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    expect(find.text('You Lose!'), findsWidgets);

    final buttonFinder = find.byType(RaisedButton);
    final button = tester.widget<RaisedButton>(buttonFinder);
    expect(button.color, Colors.red[50]);

    expect(find.text('Discard'), findsNothing);
  });

  testWidgets('should render a replace action', (WidgetTester tester) async {
    final replacementCard = LandAhoy();
    final action =
    ReplaceAction(replacementCard, "Sail for land", [Resource.FOOD, Resource.FOOD]);
    await tester.pumpWidget(createWidgetForTesting(
        child: CardActionPanel(action, makeGameState())));

    expect(find.text('Sail for land'), findsWidgets);
    expect(find.text('(F, F)'), findsWidgets);
    expect(find.byIcon(Icons.description), findsOneWidget);
    expect(find.text(replacementCard.name), findsOneWidget);

    expect(find.byIcon(Icons.delete), findsOneWidget);
    expect(find.text('Exile'), findsOneWidget);
  });
}
