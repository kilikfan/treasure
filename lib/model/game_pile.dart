enum GamePile {
  DECK,
  DISCARD
}

extension GamePileExt on GamePile {
  String get description {
    return this == GamePile.DECK ? "Deck" : "Discard";
  }
}