import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

class AudioModel {
  final SettingsModel _settingsModel;
  final AudioPlayer _musicPlayer;
  final AudioCache _musicCache;
  final AudioCache _soundCache;
  var _playingMusic = false;
  var _lastRequestedMusic;

  AudioModel(this._settingsModel, this._musicPlayer, this._musicCache, this._soundCache) {
    _settingsModel.addListener(_settingsChanged);
  }

  Future<void> loopMusic(String track) async {
    _lastRequestedMusic = track;
    if (_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await _musicCache.loop(track, volume: 0.5);
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
      await _soundCache.play(sound);
    }
  }

  void _settingsChanged() async {
    if (!_settingsModel.isSettingEnabled(AppSetting.musicEnabled) && _playingMusic) {
      await _musicPlayer.stop();
      _playingMusic = false;
    } else if (!_playingMusic) {
      loopMusic(_lastRequestedMusic);
    }
  }
}