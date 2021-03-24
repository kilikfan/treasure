import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

void main() {
  test('should exile the current card and add resources', () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    final currentCard = state.nextCard();

    final action = ExileAction(reward: [Resource.LANDLUBBER]);
    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.playerHand.cards, [Resource.CREW, Resource.LANDLUBBER]);
  });

  test('should have no reward, cost or description by default', () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    final currentCard = state.nextCard();

    final action = ExileAction();
    expect(action.description, 'Exile this card.');

    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.playerHand.cards, [Resource.CREW]);
  });

  test('should take a custom description, and support having a cost', () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    final currentCard = state.nextCard();

    final action = ExileAction(description: 'Foo', cost: const SimpleCost([Resource.CREW]), reward: [Resource.DOUBLOON]);
    expect(action.description, 'Foo');

    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.playerHand.cards, [Resource.DOUBLOON]);
  });
}