import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

class MockListShuffler extends Mock implements ListShuffler {}
class MockFunction extends Mock implements EmptyFunctions {}

class EmptyFunctions {
  void fn() {}
  void fnOne(Object arg1) {}
}