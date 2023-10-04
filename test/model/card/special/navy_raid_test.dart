import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/card/special/navy_raid.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

void main() {
  test('conscription action should have correct costs', () {
    final oddState = makeGameState(
        playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY]);
    final eventState =
        makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY]);

    expect(const NavyRaid().getConscriptionAction(oddState).cost,
        const SimpleCost([Resource.INFAMY, Resource.INFAMY, Resource.CREW]));
    expect(const NavyRaid().getConscriptionAction(eventState).cost,
        const SimpleCost([Resource.INFAMY]));
  });

  test('taxation action should have correct costs', () {
    final oddState = makeGameState(
        playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY]);
    final eventState =
        makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY]);

    expect(
        const NavyRaid().getTaxationAction(oddState).cost,
        const SimpleCost([
          Resource.INFAMY,
          Resource.INFAMY,
          Resource.DOUBLOON,
          Resource.DOUBLOON
        ]));
    expect(const NavyRaid().getTaxationAction(eventState).cost,
        const SimpleCost([Resource.INFAMY, Resource.DOUBLOON]));
  });
}

extension NavyRaidExt on NavyRaid {
  CardAction getConscriptionAction(GameState state) => getActions(state)[0];
  CardAction getTaxationAction(GameState state) => getActions(state)[1];
}
