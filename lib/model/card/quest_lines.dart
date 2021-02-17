enum QuestLine { NULL, HISPANIOLA, INTO_THE_DEPTHS }

extension QuestLineExt on QuestLine {
  String get description {
    if (this == QuestLine.HISPANIOLA) {
      return "Hispaniola";
    } else if (this == QuestLine.INTO_THE_DEPTHS) {
      return "Into the Depths";
    } else {
      return "";
    }
  }

  int get maxStage {
    if (this == QuestLine.HISPANIOLA) {
      return 4;
    } else if (this == QuestLine.INTO_THE_DEPTHS) {
      return 4;
    } else {
      return 0;
    }
  }
}
