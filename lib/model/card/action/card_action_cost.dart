import '../../game_state.dart';

abstract class CardActionCost {
  String getDescription();
  bool isAffordable(GameState state);
  void deductCost(GameState state);
  bool isEmpty();
}