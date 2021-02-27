enum QuestLine { NULL, HISPANIOLA, INTO_THE_DEPTHS }

extension QuestLineExt on QuestLine {
  String get description {
    switch (this) {
      case QuestLine.HISPANIOLA:
        return "Hispaniola";
      case QuestLine.INTO_THE_DEPTHS:
        return "Into the Depths";
      default:
        return "";
    }
  }

  int get maxStage {
    switch (this) {
      case QuestLine.HISPANIOLA:
        return 4;
      case QuestLine.INTO_THE_DEPTHS:
        return 4;
      default:
        return 0;
    }
  }
}
