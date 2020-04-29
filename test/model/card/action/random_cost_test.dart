import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/model/card/action/random_cost.dart';
import 'package:treasure_of_the_high_seas/model/hand.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';

import '../../../mocks.dart';

main() {
  test('should correctly report whether it is affordable', () {
    final hand = Hand([Resource.FOOD, Resource.LANDLUBBER, Resource.CREW]);

    expect(RandomCost(2).isAffordable(hand), true);
    expect(RandomCost(3).isAffordable(hand), true);
    expect(RandomCost(4).isAffordable(hand), false);
  });

  test('should describe its cost', () {
    expect(RandomCost(1).getDescription(), "1 x ?");
    expect(RandomCost(3).getDescription(), "3 x ?");
  });

  test('should correctly report when its empty', () {
    expect(RandomCost(0).isEmpty(), true);
    expect(RandomCost(1).isEmpty(), false);
    expect(RandomCost(5).isEmpty(), false);
  });

  test('should deduct its cost - with mock', () {
    final randomiser = MockRandomiser();
    final playerHand = Hand([Resource.FOOD, Resource.FOOD, Resource.CREW, Resource.DOUBLOON, Resource.MAP]);

    final cost = RandomCost(3, randomiser: randomiser);
    cost.deductCost(playerHand);

    expect(playerHand.cards, [Resource.DOUBLOON, Resource.MAP]);
    verify(randomiser.shuffle([Resource.FOOD, Resource.FOOD, Resource.CREW, Resource.DOUBLOON, Resource.MAP]));
  });

  test('should deduct its cost - with fake', () {
    final randomiser = FakeRandomiser();
    final playerHand = Hand([Resource.FOOD, Resource.FOOD, Resource.CREW, Resource.DOUBLOON, Resource.MAP]);

    final cost = RandomCost(2, randomiser: randomiser);
    cost.deductCost(playerHand);

    expect(playerHand.cards, [Resource.FOOD, Resource.FOOD, Resource.CREW]);
  });
}