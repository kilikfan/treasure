import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/trade_action.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

void main () {
  test('should deduct its cost and add the reward', () {
    final state = makeGameState(playerHand: [Resource.DOUBLOON]);
    final action = TradeAction('Buy crew members', [Resource.DOUBLOON], [Resource.CREW, Resource.CREW]);

    expect(action.description, 'Buy crew members');
    action.performAction(state);

    expect(state.playerHand.cards, [Resource.CREW, Resource.CREW]);
  });
}