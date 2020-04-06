import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/exile_action.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

main() {
  test('should exile the current card and add resources', () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    final currentCard = state.nextCard();

    final action = new ExileAction([Resource.LANDLUBBER]);
    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.playerHand.cards, [Resource.CREW, Resource.LANDLUBBER]);
  });

  test('should have no reward by default', () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    final currentCard = state.nextCard();

    final action = new ExileAction();
    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.playerHand.cards, [Resource.CREW]);
  });
}