import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';
import 'package:treasure_of_the_high_seas/model/card/special/navy_raid.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

void main() {
  test('conscription action should have correct costs', () {
    final oddState = makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY]);
    final eventState = makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY]);

    expect(NavyRaid().getConscriptionAction(oddState).cost.getDescription(), "(I, I, C)");
    expect(NavyRaid().getConscriptionAction(eventState).cost.getDescription(), "(I)");
  });

  test('taxation action should have correct costs', () {
    final oddState = makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY, Resource.INFAMY]);
    final eventState = makeGameState(playerHand: [Resource.INFAMY, Resource.INFAMY]);

    expect(NavyRaid().getTaxationAction(oddState).cost.getDescription(), "(I, I, D, D)");
    expect(NavyRaid().getTaxationAction(eventState).cost.getDescription(), "(I, D)");
  });
}

extension NavyRaidExt on NavyRaid {
  CardAction getConscriptionAction(GameState state) => getActions(state)[0];
  CardAction getTaxationAction(GameState state) => getActions(state)[1];
}