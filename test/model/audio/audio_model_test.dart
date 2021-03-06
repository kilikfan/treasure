import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

import '../../mocks.dart';

Future<AudioModel> makeAudioModel(
    {SettingsModel settingsModel,
    AudioPlayer musicPlayer,
    AudioCache musicCache,
    AudioCache soundCache}) async {
  return AudioModel(
      settingsModel ?? SettingsModel(await SharedPreferences.getInstance()),
      musicPlayer ?? MockAudioPlayer(),
      musicCache ?? MockAudioCache(),
      soundCache ?? MockAudioCache());
}

void main() {
  test('should not play music when setting disabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicCache = MockAudioCache();
    final model = await makeAudioModel(musicCache: musicCache);
    await model.loopMusic(MENU_MUSIC);

    verifyZeroInteractions(musicCache);
  });

  test('should loop chosen music when setting enabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicCache = MockAudioCache();
    final model =
        await makeAudioModel(musicCache: musicCache);
    await model.loopMusic(MENU_MUSIC);

    verify(musicCache.loop(MENU_MUSIC, volume: 0.5));
  });

  test('should stop playing music when music setting toggled off', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    final audioModel = await makeAudioModel(settingsModel: settingsModel, musicPlayer: musicPlayer);
    await audioModel.loopMusic(MENU_MUSIC);

    await settingsModel.updateSetting(AppSetting.musicEnabled, false);
    verify(musicPlayer.stop());
  });

  test('should start playing menu music when music setting toggled on by default', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicCache = MockAudioCache();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    await makeAudioModel(settingsModel: settingsModel, musicCache: musicCache);

    await settingsModel.updateSetting(AppSetting.musicEnabled, true);
    verify(musicCache.loop(MENU_MUSIC, volume: 0.5));
  });

  test('should do nothing if settings change and music already playing', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicCache = MockAudioCache();
    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    final audioModel = await makeAudioModel(settingsModel: settingsModel, musicCache: musicCache, musicPlayer: musicPlayer);
    await audioModel.loopMusic(GAME_MUSIC);

    reset(musicCache);
    reset(musicPlayer);

    await settingsModel.updateSetting(AppSetting.sfxEnabled, true);

    verifyZeroInteractions(musicCache);
    verifyZeroInteractions(musicPlayer);
  });

  test('should do nothing if settings change and music already stopped', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicCache = MockAudioCache();
    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    await makeAudioModel(settingsModel: settingsModel, musicCache: musicCache, musicPlayer: musicPlayer);

    await settingsModel.updateSetting(AppSetting.sfxEnabled, true);

    verifyZeroInteractions(musicCache);
    verifyZeroInteractions(musicPlayer);
  });

  test('should not play sounds if setting disabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.sfxEnabled.toString(): false});

    final soundCache = MockAudioCache();
    final audioModel = await makeAudioModel(soundCache: soundCache);

    await audioModel.playSound('baa.mp3');
    verifyZeroInteractions(soundCache);
  });

  test('should play the specified sound if the setting is enabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.sfxEnabled.toString(): true});

    final soundCache = MockAudioCache();
    final audioModel = await makeAudioModel(soundCache: soundCache);

    await audioModel.playSound('baa.mp3');
    verify(soundCache.play('baa.mp3'));
  });

  test('should start playing the last requested track when music setting toggled on', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicCache = MockAudioCache();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    final audioModel = await makeAudioModel(settingsModel: settingsModel, musicCache: musicCache);
    await audioModel.loopMusic(GAME_MUSIC);
    verifyZeroInteractions(musicCache);

    await settingsModel.updateSetting(AppSetting.musicEnabled, true);
    verify(musicCache.loop(GAME_MUSIC, volume: 0.5));
  });

  test('should support pausing music', () async {
    final musicPlayer = MockAudioPlayer();
    final audioModel = await makeAudioModel(musicPlayer: musicPlayer);

    await audioModel.pauseMusic();
    verify(musicPlayer.pause());
  });

  test('should support resuming music if music was playing', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicPlayer = MockAudioPlayer();
    final audioModel = await makeAudioModel(musicPlayer: musicPlayer);
    await audioModel.loopMusic('foobar');

    await audioModel.resumeMusic();
    verify(musicPlayer.resume());
  });

  test('should not resume music if music was not playing', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicPlayer = MockAudioPlayer();
    final audioModel = await makeAudioModel(musicPlayer: musicPlayer);
    await audioModel.loopMusic('foobar');

    await audioModel.resumeMusic();
    verifyZeroInteractions(musicPlayer);
  });
}
