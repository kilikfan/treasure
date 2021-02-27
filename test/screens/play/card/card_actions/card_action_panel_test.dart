import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/scry_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/action/trade_action.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_2_land_ahoy.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_actions/card_action_line.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_actions/card_action_panel.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_actions/card_action_text.dart';

import '../../../../mocks.dart';
import '../../../../test_utils.dart';

class DummyAction extends CardAction {
  final Function(Object) fn;

  DummyAction(List<Resource> cost, bool enabled, {this.fn, String soundEffect})
      : super(SimpleCost(cost), "Some Action", soundEffect: soundEffect) {
    this.enabled = enabled;
  }

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
  CardActionDetails get actionDetails => CardActionDetails(cost, description);
}

void main() {
  testWidgets('should display a blank, disabled button if not passed an action',
      (WidgetTester tester) async {
    await tester.launchWidget(child: CardActionPanel(null), state: makeGameState());

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
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

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
    final action = DummyAction([Resource.DOUBLOON], true, fn: performAction);
    await tester.launchWidget(child: CardActionPanel(action), state: state);

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

  testWidgets('should play sound effect on tap if the action has one',
      (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    final action = DummyAction([Resource.DOUBLOON], true, soundEffect: 'baa.mp3');
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState(), audioModel: audioModel);

    final buttonFinder = find.byType(RaisedButton);
    await tester.tap(buttonFinder);

    verify(audioModel.playSound('baa.mp3'));
  });

  testWidgets('should not attempt to play sound if none specified',
      (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    final action = DummyAction([Resource.DOUBLOON], true, soundEffect: null);
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState(), audioModel: audioModel);

    final buttonFinder = find.byType(RaisedButton);
    await tester.tap(buttonFinder);

    verifyZeroInteractions(audioModel);
  });

  testWidgets('should render a scry action', (WidgetTester tester) async {
    final action = ScryAction("See the future.", [Resource.FOOD], 3);
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

    expect(find.text('See the future.'), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.text('Scry 3'), findsOneWidget);
  });

  testWidgets('should render a reward', (WidgetTester tester) async {
    final action =
        TradeAction("Buy some food", [Resource.DOUBLOON], [Resource.FOOD]);
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

    expect(find.text('Buy some food'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    expect(find.text('(F)'), findsOneWidget);
  });

  testWidgets('should render a win action, and not display the Discard line', (WidgetTester tester) async {
    final action =
    EndGameAction(GameResult.WIN, [], "You Win!");
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

    expect(find.text('You Win!'), findsWidgets);

    final buttonFinder = find.byType(RaisedButton);
    final button = tester.widget<RaisedButton>(buttonFinder);
    expect(button.color, Colors.green[50]);

    expect(find.text('Discard'), findsNothing);
  });

  testWidgets('should render a loss action, and not display the Discard line', (WidgetTester tester) async {
    final action =
    EndGameAction(GameResult.LOSE, [], "You Lose!");
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

    expect(find.text('You Lose!'), findsWidgets);

    final buttonFinder = find.byType(RaisedButton);
    final button = tester.widget<RaisedButton>(buttonFinder);
    expect(button.color, Colors.red[50]);

    expect(find.text('Discard'), findsNothing);
  });

  testWidgets('should render a replace action', (WidgetTester tester) async {
    final replacementCard = LandAhoy();
    final action =
    ReplaceAction(replacementCard, ReplaceType.FORWARDS, "Sail for land", cost: [Resource.FOOD, Resource.FOOD]);
    await tester.launchWidget(child: CardActionPanel(action), state: makeGameState());

    expect(find.text('Sail for land'), findsWidgets);
    expect(find.text('(F, F)'), findsWidgets);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    expect(find.text(replacementCard.name), findsOneWidget);

    expect(find.byIcon(Icons.delete), findsOneWidget);
    expect(find.text('Exile'), findsOneWidget);
  });

  testWidgets('should support readOnly mode', (WidgetTester tester) async {
    final action = DummyAction([Resource.DOUBLOON], true);
    await tester.launchWidget(child: CardActionPanel(action, readOnly: true), state: makeGameState());

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(RaisedButton), findsNothing);

    final textFinder = find.text('Some Action');
    final costFinder = find.text('(D)');
    expect(textFinder, findsOneWidget);
    expect(costFinder, findsOneWidget);
  });
}
