import 'package:audioplayers/audioplayers.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

import 'audio_constants.dart';

class AudioModel {
  final SettingsModel _settingsModel;
  final AudioPlayer _musicPlayer;
  final AudioPlayer _soundPlayer;
  var _playingMusic = false;
  var _lastRequestedMusic = MENU_MUSIC;

  AudioModel(this._settingsModel, this._musicPlayer, this._soundPlayer) {
    _settingsModel.addListener(_settingsChanged);
  }

  Future<void> loopMusic(String track) async {
    _lastRequestedMusic = track;
    if (_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await _musicPlayer.setReleaseMode(ReleaseMode.loop);
      await _musicPlayer.play(AssetSource('music/$track'), volume: 0.5);
      _playingMusic = true;
    }
  }

  Future<void> pauseMusic() async {
    await _musicPlayer.pause();
  }

  Future<void> resumeMusic() async {
    if (_playingMusic) {
      await _musicPlayer.resume();
    }
  }

  Future<void> playSound(String sound) async {
    if (_settingsModel.isSettingEnabled(AppSetting.sfxEnabled)) {
      await _soundPlayer.play(AssetSource('sfx/$sound'));
    }
  }

  Future<void> _settingsChanged() async {
    if (!_settingsModel.isSettingEnabled(AppSetting.musicEnabled) &&
        _playingMusic) {
      await _musicPlayer.stop();
      _playingMusic = false;
    } else if (!_playingMusic) {
      await loopMusic(_lastRequestedMusic);
    }
  }
}
