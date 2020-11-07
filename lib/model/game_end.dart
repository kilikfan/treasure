enum GameEnd {
  NEWGAME,
  EXIT
}

extension GameEndExt on GameEnd {
  String getDescription() {
    if (this == GameEnd.NEWGAME) {
      return "New Game";
    } else {
      return "Exit";
    }
  }
}