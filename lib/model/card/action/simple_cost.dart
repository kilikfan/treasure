import 'package:flutter/foundation.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action_cost.dart';

import '../../hand.dart';
import '../../resource.dart';

class SimpleCost extends CardActionCost {
  final List<Resource> cost;

  const SimpleCost(this.cost);

  @override
  void deductCost(Hand hand) {
    hand.deductResources(cost);
  }

  @override
  String getDescription(Hand hand) {
    final realCost = hand.getRealCost(cost) ?? List<Resource>.from(cost);
    realCost.sort((r1, r2) => r1.index.compareTo(r2.index));
    return '${realCost.map((res) => res.getText())}';
  }

  @override
  bool isAffordable(Hand hand) => hand.canAfford(cost);

  @override
  bool isEmpty() => cost.isEmpty;

  /// Generated boilerplate yuck for equals/hashcode
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleCost &&
          runtimeType == other.runtimeType &&
          listEquals(cost, other.cost);

  @override
  int get hashCode => cost.hashCode;
}
