import '../../hand.dart';

abstract class CardActionCost {
  const CardActionCost();

  String getDescription(Hand hand);
  bool isAffordable(Hand hand);
  void deductCost(Hand hand);
  bool isEmpty();
}
