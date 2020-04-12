import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

main() {
  test('should support winning the game', () {
    final state = makeGameState(playerHand: [Resource.CREW]);

    final action = new EndGameAction(GameResult.WIN, [Resource.CREW]);
    expect(action.description, "You Win!");

    action.performAction(state);
    expect(state.result, GameResult.WIN);
  });

  test('should support losing the game', () {
    final state = makeGameState(playerHand: [Resource.CREW]);

    final action = new EndGameAction(GameResult.LOSE, []);
    expect(action.description, "You Lose!");

    action.performAction(state);
    expect(state.result, GameResult.LOSE);
  });
}