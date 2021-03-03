import 'package:treasure_of_the_high_seas/model/card/quest_lines.dart';

import 'card.dart';
import 'card_types.dart';

abstract class QuestCard extends Card {
  final QuestLine questLine;
  final int questStage;

  const QuestCard(String name, this.questLine, this.questStage)
      : super(name, type: CardType.QUEST);

  @override
  String getSubHeaderText() =>
      "${this.questLine.description} ${this.questStage}/${this.questLine.maxStage}";
}
