import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';

import '../../hand.dart';
import '../../resource.dart';

class SimpleCost extends CardActionCost {
  final List<Resource> cost;

  SimpleCost(this.cost);

  @override
  void deductCost(Hand hand) {
    hand.deductResources(cost);
  }

  @override
  String getDescription() => "${cost.map((res) => res.getText())}";

  @override
  bool isAffordable(Hand hand) => hand.canAfford(cost);

  @override
  bool isEmpty() => cost.isEmpty;
}
