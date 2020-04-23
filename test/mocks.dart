import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

class MockRandomiser extends Mock implements Randomiser {}
class MockFunction extends Mock implements EmptyFunctions {}

class FakeRandomiser extends Fake implements Randomiser {

  final bool coinFlip;

  FakeRandomiser(this.coinFlip);

  @override
  bool flipCoin() {
    return coinFlip;
  }
}

class EmptyFunctions {
  void fn() {}
  void fnOne(Object arg1) {}
}