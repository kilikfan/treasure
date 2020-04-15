import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/replace_action.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_2_land_ahoy.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

main() {
  test('should exile the current card and add replacement to the discard pile', () {
    const rumoursOfAnIsland = RumoursOfAnIsland();
    const landAhoy = LandAhoy();
    const plunderAWreck = PlunderAWreck();

    final state = makeGameState(playerHand: [Resource.CREW], deck: [rumoursOfAnIsland, plunderAWreck]);
    final currentCard = state.nextCard();

    final action = new ReplaceAction(landAhoy, "");
    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.discard, [landAhoy]);
    expect(state.playerHand.cards, [Resource.CREW]);
  });

  test('should support an optional cost', () {
    const rumoursOfAnIsland = RumoursOfAnIsland();
    const landAhoy = LandAhoy();
    const plunderAWreck = PlunderAWreck();

    final state = makeGameState(playerHand: [Resource.CREW], deck: [rumoursOfAnIsland, plunderAWreck]);
    final currentCard = state.nextCard();

    final action = new ReplaceAction(landAhoy, "", [Resource.CREW]);
    action.performAction(state);

    expect(state.exile, [currentCard]);
    expect(state.discard, [landAhoy]);
    expect(state.playerHand.cards, []);
  });
}