import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/end_game_action.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../test_utils.dart';

main() {
  test('should support winning the game', () {
    final state = makeGameState(playerHand: [Resource.CREW]);

    final action = new EndGameAction(GameResult.WIN, [Resource.CREW], "The winner takes it all!");
    expect(action.description, "The winner takes it all!");

    final lastCard = state.currentCard;
    action.performAction(state);
    expect(state.result, GameResult.WIN);

    //Check that we have not progressed to the next card
    expect(state.currentCard,lastCard);
  });

  test('should support losing the game', () {
    final state = makeGameState(playerHand: [Resource.CREW]);

    final action = new EndGameAction(GameResult.LOSE, [], "The loser standing small.");
    expect(action.description, "The loser standing small.");

    final lastCard = state.currentCard;
    action.performAction(state);
    expect(state.result, GameResult.LOSE);

    //Check that we have not progressed to the next card
    expect(state.currentCard,lastCard);
  });
}