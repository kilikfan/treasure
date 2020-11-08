import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';

class MockRandomiser extends Mock implements Randomiser {}
class MockFunction extends Mock implements EmptyFunctions {}
class MockResourceLoader extends Mock implements ResourceLoader {}

class FakeRandomiser extends Fake implements Randomiser {

  final bool coinFlip;

  FakeRandomiser([this.coinFlip = true]);

  @override
  void shuffle(List<Object> list) {
    list.setAll(0, list.reversed);
  }

  @override
  bool flipCoin() {
    return coinFlip;
  }
}

class EmptyFunctions {
  void fn() {}
  void fnOne(Object arg1) {}
}