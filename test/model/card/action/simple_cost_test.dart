import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/action/simple_cost.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/model/hand.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

void main() {
  test('should correctly report whether it is affordable', () {
    const cost = SimpleCost([Resource.FOOD]);

    expect(cost.isAffordable(Hand([])), false);
    expect(cost.isAffordable(Hand([Resource.CREW])), false);
    expect(cost.isAffordable(Hand([Resource.FOOD])), true);
  });

  test('should describe its cost as-is when it can be afforded', () {
    final hand = Hand([Resource.LANDLUBBER, Resource.FOOD, Resource.FOOD]);
    expect(const SimpleCost([Resource.FOOD]).getDescription(hand), '(F)');
    expect(
        const SimpleCost([Resource.LANDLUBBER, Resource.FOOD, Resource.FOOD])
            .getDescription(hand),
        '(L, F, F)');
  });

  test('should describe its cost as-is when it cannot be afforded', () {
    expect(const SimpleCost([Resource.FOOD]).getDescription(Hand()), '(F)');
    expect(
        const SimpleCost([Resource.LANDLUBBER, Resource.FOOD, Resource.FOOD])
            .getDescription(Hand()),
        '(L, F, F)');
  });

  test('should describe its cost in real terms when a map will be required',
      () {
    final hand = Hand([Resource.FOOD, Resource.FOOD, Resource.MAP]);
    expect(
        const SimpleCost([Resource.FOOD, Resource.FOOD, Resource.FOOD])
            .getDescription(hand),
        '(M, F, F)');
  });

  test('should correctly report when it is empty', () {
    expect(const SimpleCost([]).isEmpty(), true);
    expect(const SimpleCost([Resource.FOOD]).isEmpty(), false);
  });

  test('should deduct its cost', () {
    final playerHand = Hand(INITIAL_RESOURCES);

    const cost = SimpleCost(
        [Resource.FOOD, Resource.CREW, Resource.CREW, Resource.DOUBLOON]);

    cost.deductCost(playerHand);

    expect(playerHand.cards, [
      Resource.LANDLUBBER,
      Resource.LANDLUBBER,
      Resource.FOOD,
      Resource.DOUBLOON,
    ]);
  });
}
