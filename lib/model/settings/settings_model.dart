import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppSetting { musicEnabled, sfxEnabled }

extension AppSettingExtension on AppSetting {
  bool isEnabled(BuildContext context) =>
      Provider.of<SettingsModel>(context).isSettingEnabled(this);
}

class SettingsModel extends ChangeNotifier {
  final Map<AppSetting, bool> _settings = {};
  final SharedPreferences _prefs;

  SettingsModel(this._prefs) {
    for (final setting in AppSetting.values) {
      _settings[setting] = _prefs.getBool(setting.toString()) ?? false;
    }
  }

  bool isSettingEnabled(AppSetting setting) => _settings[setting] ?? false;

  Future<void> updateSetting(AppSetting setting, bool value) async {
    _settings[setting] = value;
    notifyListeners();
    await _prefs.setBool(setting.toString(), value);
  }
}
