import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

import 'mocks.dart';
import 'model/audio/audio_model_test.dart';
import 'test_utils.dart';

void main() {

  testWidgets('should start playing game music when music setting toggled on from in game', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicCache = MockAudioCache();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    var audioModel = await makeAudioModel(settingsModel: settingsModel, musicCache: musicCache);

    await launchGameFromMenu(tester, audioModel: audioModel);

    settingsModel.updateSetting(AppSetting.musicEnabled, true);
    verify(musicCache.loop(GAME_MUSIC, volume: 0.5));
  });

}
