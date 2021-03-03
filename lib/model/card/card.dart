import '../game_state.dart';
import 'action/card_action.dart';
import 'card_types.dart';

abstract class Card {
  final String name;
  final CardType type;

  const Card(this.name,
      {this.type = CardType.BASIC});

  List<CardAction> getActions(GameState state);

  String getSubHeaderText() => "";
}
