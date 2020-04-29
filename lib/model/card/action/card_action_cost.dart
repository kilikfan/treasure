import '../../hand.dart';

abstract class CardActionCost {
  const CardActionCost();

  String getDescription();
  bool isAffordable(Hand hand);
  void deductCost(Hand hand);
  bool isEmpty();
}