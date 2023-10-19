import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';
import 'package:treasure_of_the_high_seas/screens/settings_page.dart';

import '../test_utils.dart';

void main() {
  testWidgets('should initialise with correct switches based on preferences',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      AppSetting.musicEnabled.toString(): true,
      AppSetting.sfxEnabled.toString(): false
    });

    await tester.launchWidget(child: SettingsPage());

    final musicSwitchFinder = find.widgetWithText(SwitchListTile, 'Music');
    final sfxSwitchFinder =
        find.widgetWithText(SwitchListTile, 'Sound Effects');
    final musicToggle = tester.widget<SwitchListTile>(musicSwitchFinder);
    final sfxToggle = tester.widget<SwitchListTile>(sfxSwitchFinder);

    expect(musicToggle.value, true);
    expect(sfxToggle.value, false);
  });

  testWidgets('should update shared preferences and screen value on tap',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs =
        await tester.runAsync(() async => SharedPreferences.getInstance());

    await tester.launchWidget(child: SettingsPage());

    final musicSwitchFinder = find.widgetWithText(SwitchListTile, 'Music');
    final musicToggle = tester.widget<SwitchListTile>(musicSwitchFinder);
    expect(musicToggle.value, false);

    await tester.tap(musicSwitchFinder);
    await tester.pumpAndSettle();

    final updatedToggle = tester.widget<SwitchListTile>(musicSwitchFinder);
    expect(prefs?.getBool(AppSetting.musicEnabled.toString()), true);
    expect(updatedToggle.value, true);
  });
}
