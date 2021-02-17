import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import '../game_state.dart';
import 'action/card_action.dart';
import 'card_types.dart';

abstract class Card {
  final String name;
  final CardType type;
  final int questStage;
  final QuestLine questLine;

  const Card(this.name,
      {this.type = CardType.BASIC,
      this.questStage = 0,
      this.questLine = QuestLine.NULL});

  List<CardAction> getActions(GameState state);
}
