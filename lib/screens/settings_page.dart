import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildPreferenceTile(
              context, AppSetting.musicEnabled, 'Music', Icons.music_note),
          _buildPreferenceTile(
              context, AppSetting.sfxEnabled, 'Sound Effects', Icons.speaker),
        ],
      ),
    );
  }

  SwitchListTile _buildPreferenceTile(BuildContext context, AppSetting setting,
          String label, IconData icon) =>
      SwitchListTile(
        title: Text(label),
        secondary: Icon(icon),
        value: setting.isEnabled(context),
        onChanged: (bool value) {
          Provider.of<SettingsModel>(context, listen: false)
              .updateSetting(setting, value);
        },
      );
}
