import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/scurvy.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

void main() {
  test('should not enable the doctor action if hand contains at least one crew',
      () {
    final state = makeGameState(playerHand: [Resource.CREW]);
    expect(const Scurvy().getDoctorAction(state).enabled, false);
  });

  test('should enable the doctor action if hand contains 0 crew', () {
    final state = makeGameState(playerHand: [Resource.FOOD]);
    expect(const Scurvy().getDoctorAction(state).enabled, true);
  });

  test('weevils action should cost half the players crew', () {
    final state = makeGameState(playerHand: [Resource.CREW, Resource.CREW]);
    expect(const Scurvy().getWeevilsAction(state).cost,
        const SimpleCost([Resource.CREW]));
  });

  test(
      'weevils action should round up the cost if player has an odd crew number',
      () {
    final state = makeGameState(
        playerHand: [Resource.CREW, Resource.CREW, Resource.CREW]);
    expect(const Scurvy().getWeevilsAction(state).cost,
        const SimpleCost([Resource.CREW, Resource.CREW]));
  });
}

extension ScurvyExt on Scurvy {
  CardAction getWeevilsAction(GameState state) => getActions(state)[1];
  CardAction getDoctorAction(GameState state) => getActions(state)[2];
}
