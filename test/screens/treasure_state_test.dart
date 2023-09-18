import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/screens/app.dart';

import '../mocks.dart';

void main() {
  test('should resume music on resume', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    final audioModel = MockAudioModel();

    final state = TreasureState(audioModel);
    state.initState();

    WidgetsBinding.instance.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    verify(audioModel.resumeMusic());
  });

  void _verifyMusicPaused(AppLifecycleState state) {
    TestWidgetsFlutterBinding.ensureInitialized();

    final audioModel = MockAudioModel();

    final treasureState = TreasureState(audioModel);
    treasureState.initState();

    WidgetsBinding.instance.handleAppLifecycleStateChanged(state);
    verify(audioModel.pauseMusic());
  }

  test('should pause music on lifecycle events other than resume', () {
    _verifyMusicPaused(AppLifecycleState.detached);
    _verifyMusicPaused(AppLifecycleState.inactive);
    _verifyMusicPaused(AppLifecycleState.paused);
  });
}