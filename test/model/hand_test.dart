import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/exceptions.dart';
import 'package:treasure_of_the_high_seas/model/hand.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

void main() {
  test('should add resources to the players hand and sort it by resource', () {
    final hand = Hand();

    hand.addResources([Resource.CREW, Resource.DOUBLOON, Resource.CREW]);
    expect(hand.cards, [Resource.CREW, Resource.CREW, Resource.DOUBLOON]);

    hand.addResources([Resource.CREW, Resource.MAP]);
    expect(hand.cards, [
      Resource.MAP,
      Resource.CREW,
      Resource.CREW,
      Resource.CREW,
      Resource.DOUBLOON
    ]);
  });

  test('should correctly report whether a cost is affordable', () {
    final hand =
        Hand([Resource.CREW, Resource.MAP, Resource.FOOD, Resource.FOOD]);

    expect(hand.canAfford([Resource.FOOD, Resource.CREW]), true);
    expect(hand.canAfford([Resource.FOOD, Resource.FOOD, Resource.FOOD]), true);
    expect(hand.canAfford([Resource.DOUBLOON, Resource.CREW]), true);

    expect(hand.canAfford([Resource.DOUBLOON, Resource.LANDLUBBER]), false);
    expect(hand.canAfford([Resource.DOUBLOON, Resource.MAP]), false);
    expect(
        hand.canAfford(
            [Resource.FOOD, Resource.FOOD, Resource.FOOD, Resource.FOOD]),
        false);
  });

  test('should deduct resources correctly, only deducting maps when needed',
      () {
    final hand =
        Hand([Resource.CREW, Resource.MAP, Resource.FOOD, Resource.FOOD]);

    hand.deductResources([Resource.CREW, Resource.FOOD]);

    expect(hand.cards, [Resource.MAP, Resource.FOOD]);

    hand.deductResources([Resource.FOOD]);
    expect(hand.cards, [Resource.MAP]);

    hand.deductResources([Resource.FOOD]);
    expect(hand.cards, []);
  });

  test('should deduct a map for a resource that isnt owned', () {
    final hand = Hand([Resource.CREW, Resource.MAP]);
    hand.deductResources([Resource.LANDLUBBER]);
    expect(hand.cards, [Resource.CREW]);
  });

  test('should describe the real cost if maps are required', () {
    final hand =
        Hand([Resource.CREW, Resource.MAP, Resource.FOOD, Resource.FOOD]);

    expect(hand.getRealCost([Resource.FOOD, Resource.FOOD]),
        [Resource.FOOD, Resource.FOOD]);
    expect(hand.getRealCost([Resource.LANDLUBBER]), [Resource.MAP]);
  });

  test('should return a real cost of null if not affordable', () {
    final hand = Hand([]);
    expect(hand.getRealCost([Resource.FOOD]), null);
  });

  test(
      'should throw an error if trying to deduct resources that cannot be afforded',
      () {
    final hand = Hand([Resource.CREW, Resource.FOOD]);

    expect(() => hand.deductResources([Resource.LANDLUBBER]),
        throwsA(const TypeMatcher<CannotAffordError>()));
  });
}
