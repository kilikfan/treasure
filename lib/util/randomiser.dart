import 'dart:math';

class Randomiser {
  const Randomiser();

  void shuffle(List<Object> list) {
    list.shuffle();
  }

  bool flipCoin() {
    final random = new Random();
    return random.nextBool();
  }
}
