import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

class AudioModel {
  final SettingsModel _settingsModel;
  final AudioCache _musicPlayer = AudioCache(prefix: 'assets/music/', fixedPlayer: AudioPlayer());

  AudioModel(this._settingsModel) {
    _settingsModel.addListener(_settingsChanged);
  }

  Future<void> loopMusic(String track) async {
    if (_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await _musicPlayer.fixedPlayer.stop();
      await _musicPlayer.loop('the-buccaneers-haul.mp3');
    }
  }

  void _settingsChanged() async {
    if (!_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await _musicPlayer.fixedPlayer.stop();
    }
  }
}