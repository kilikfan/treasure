import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action_details.dart';
import 'package:treasure_of_the_high_seas/model/card/action/scry_action.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

main() {
  test('should be enabled if cost is affordable', () {
    final state = makeGameState(playerHand: [Resource.CREW]);

    final affordable = new _FakeAction([Resource.CREW]);
    final unaffordable = new _FakeAction([Resource.LANDLUBBER]);

    expect(affordable.isEnabled(state), true);
    expect(unaffordable.isEnabled(state), false);
  });

  test('should be possible to disable regardless of cost', () {
    final state = makeGameState();
    final freeAction = new _FakeAction([]);
    freeAction.enabled = false;

    expect(freeAction.isEnabled(state), false);
  });

  test('should deduct the cost, perform the action then move on to the next card', () {
    final state = makeGameState(playerHand: [Resource.CREW, Resource.LANDLUBBER]);
    state.nextCard();

    final fn = new MockFunction().fn;
    final action = new _FakeAction([Resource.CREW], fn);

    action.performAction(state);

    expect(state.playerHand.cards, [Resource.LANDLUBBER]);
    verify(fn());
    expect(state.discard.length, 1);
  });

  test('should not automatically move on to the next card for certain actions', () {
    final state = makeGameState(playerHand: [Resource.CREW, Resource.LANDLUBBER]);
    state.nextCard();
    final card = state.currentCard;

    final action = new ScryAction("Look into the future", [Resource.CREW], 2);
    action.performAction(state);

    expect(state.currentCard, card);
  });
}

class _FakeAction extends CardAction {
  final Function() fn;

  _FakeAction(List<Resource> cost, [this.fn]) : super(cost, "Fake Action");

  @override
  void performActionImpl(GameState state) {
    if (fn != null) {
      fn();
    }
  }

  @override
  CardActionDetails get actionDetails => null;
}