import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

import '../../hand.dart';

class RandomCost extends CardActionCost {
  final int resourceCount;
  final Randomiser randomiser;

  RandomCost(this.resourceCount, {this.randomiser = const Randomiser()});

  @override
  void deductCost(Hand hand) {
    final cardsCopy = hand.cards.toList();
    randomiser.shuffle(cardsCopy);

    final cost = cardsCopy.take(resourceCount);
    hand.deductResources(cost);
  }

  @override
  String getDescription() => "$resourceCount x ?";

  @override
  bool isAffordable(Hand hand) => hand.size() >= resourceCount;

  @override
  bool isEmpty() => false;
}
