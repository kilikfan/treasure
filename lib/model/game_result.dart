enum GameResult { WIN, LOSE }

extension GameResultExt on GameResult {
  String get description {
    return this == GameResult.WIN ? 'You Win!' : 'You Lose!';
  }
}
