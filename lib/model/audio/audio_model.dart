import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

const String MENU_MUSIC = 'menu_music.wav';
const String GAME_MUSIC = 'the_buccaneers_haul.mp3';

class AudioModel {
  final SettingsModel _settingsModel;
  final AudioCache _musicPlayer = AudioCache(prefix: 'assets/music/', fixedPlayer: AudioPlayer());
  var _playingMusic = false;

  AudioModel(this._settingsModel) {
    _settingsModel.addListener(_settingsChanged);
    loopMusic(MENU_MUSIC);
  }

  Future<void> loopMusic(String track) async {
    if (_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await _musicPlayer.fixedPlayer.stop();
      await _musicPlayer.loop(track);
      _playingMusic = true;
    }
  }

  Future<void> stopMusic() async {
    await _musicPlayer.fixedPlayer.stop();
    _playingMusic = false;
  }

  void _settingsChanged() async {
    if (!_settingsModel.isSettingEnabled(AppSetting.musicEnabled)) {
      await stopMusic();
    } else if (!_playingMusic) {
      loopMusic(MENU_MUSIC);
    }
  }
}