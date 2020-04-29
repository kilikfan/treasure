import '../../hand.dart';

abstract class CardActionCost {
  String getDescription();
  bool isAffordable(Hand hand);
  void deductCost(Hand hand);
  bool isEmpty();
}