import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/model/hand.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

main() {
  test('should correctly report whether it is affordable', () {
    final cost = SimpleCost([Resource.FOOD]);

    expect(cost.isAffordable(Hand([])), false);
    expect(cost.isAffordable(Hand([Resource.CREW])), false);
    expect(cost.isAffordable(Hand([Resource.FOOD])), true);
  });

  test('should describe its cost', () {
    expect(SimpleCost([Resource.FOOD]).getDescription(), "(F)");
    expect(SimpleCost([Resource.FOOD, Resource.FOOD, Resource.LANDLUBBER]).getDescription(), "(F, F, L)");
  });

  test('should correctly report when it is empty', () {
    expect(SimpleCost([]).isEmpty(), true);
    expect(SimpleCost([Resource.FOOD]).isEmpty(), false);
  });

  test('should deduct its cost', () {
    final playerHand = Hand(INITIAL_RESOURCES);

    final cost = SimpleCost([Resource.FOOD, Resource.CREW, Resource.CREW, Resource.DOUBLOON]);

    cost.deductCost(playerHand);

    expect(playerHand.cards, [
      Resource.LANDLUBBER,
      Resource.LANDLUBBER,
      Resource.FOOD,
      Resource.DOUBLOON,
    ]);
  });
}