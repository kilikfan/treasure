import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

import '../../mocks.dart';

void main() {
  test('should initialise based on the values in SharedPreferences', () async {
    SharedPreferences.setMockInitialValues({
      AppSetting.musicEnabled.toString(): true,
      AppSetting.sfxEnabled.toString(): false
    });

    final model = SettingsModel(await SharedPreferences.getInstance());
    expect(model.isSettingEnabled(AppSetting.musicEnabled), true);
    expect(model.isSettingEnabled(AppSetting.sfxEnabled), false);
  });

  test('should initialise boolean value to false if not present', () async {
    SharedPreferences.setMockInitialValues({});

    final model = SettingsModel(await SharedPreferences.getInstance());
    expect(model.isSettingEnabled(AppSetting.musicEnabled), false);
  });

  test('should update itself and SharedPreferences when a setting is changed',
      () async {
    SharedPreferences.setMockInitialValues({});

    final prefs = await SharedPreferences.getInstance();
    final model = SettingsModel(prefs);

    await model.updateSetting(AppSetting.musicEnabled, true);

    expect(prefs.getBool(AppSetting.musicEnabled.toString()), true);
    expect(model.isSettingEnabled(AppSetting.musicEnabled), true);
  });

  test('should notify listeners when a setting is changed', () async {
    SharedPreferences.setMockInitialValues({});

    final prefs = await SharedPreferences.getInstance();
    final model = SettingsModel(prefs);

    final stateChanged = MockFunction().fn;
    model.addListener(stateChanged);

    await model.updateSetting(AppSetting.musicEnabled, true);
    verify(stateChanged());
  });
}
