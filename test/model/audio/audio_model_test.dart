import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';

@GenerateNiceMocks([MockSpec<AudioPlayer>()])
import 'audio_model_test.mocks.dart';

Future<AudioModel> makeAudioModel(
    {SettingsModel? settingsModel,
    AudioPlayer? musicPlayer,
    AudioPlayer? soundPlayer}) async {
  return AudioModel(
      settingsModel ?? SettingsModel(await SharedPreferences.getInstance()),
      musicPlayer ?? MockAudioPlayer(),
      soundPlayer ?? MockAudioPlayer());
}

void main() {
  test('should not play music when setting disabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicPlayer = MockAudioPlayer();
    final model = await makeAudioModel(musicPlayer: musicPlayer);
    await model.loopMusic(MENU_MUSIC);

    verifyZeroInteractions(musicPlayer);
  });

  test('should loop chosen music when setting enabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicPlayer = MockAudioPlayer();
    final model =
        await makeAudioModel(musicPlayer: musicPlayer);
    await model.loopMusic(MENU_MUSIC);

    verify(musicPlayer.play(AssetSource('music/$MENU_MUSIC'), volume: 0.5));
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

    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    await makeAudioModel(settingsModel: settingsModel, musicPlayer: musicPlayer);

    await settingsModel.updateSetting(AppSetting.musicEnabled, true);
    verify(musicPlayer.play(AssetSource('music/$MENU_MUSIC'), volume: 0.5));
  });

  test('should do nothing if settings change and music already playing', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): true});

    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    final audioModel = await makeAudioModel(settingsModel: settingsModel, musicPlayer: musicPlayer);
    await audioModel.loopMusic(GAME_MUSIC);

    reset(musicPlayer);

    await settingsModel.updateSetting(AppSetting.sfxEnabled, true);

    verifyZeroInteractions(musicPlayer);
  });

  test('should do nothing if settings change and music already stopped', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    await makeAudioModel(settingsModel: settingsModel, musicPlayer: musicPlayer);

    await settingsModel.updateSetting(AppSetting.sfxEnabled, true);

    verifyZeroInteractions(musicPlayer);
  });

  test('should not play sounds if setting disabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.sfxEnabled.toString(): false});

    final soundPlayer = MockAudioPlayer();
    final audioModel = await makeAudioModel(soundPlayer: soundPlayer);

    await audioModel.playSound('baa.mp3');
    verifyZeroInteractions(soundPlayer);
  });

  test('should play the specified sound if the setting is enabled', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.sfxEnabled.toString(): true});

    final soundPlayer = MockAudioPlayer();
    final audioModel = await makeAudioModel(soundPlayer: soundPlayer);

    await audioModel.playSound('baa.mp3');
    verify(soundPlayer.play(AssetSource('sfx/baa.mp3')));
  });

  test('should start playing the last requested track when music setting toggled on', () async {
    SharedPreferences.setMockInitialValues(
        {AppSetting.musicEnabled.toString(): false});

    final musicPlayer = MockAudioPlayer();
    final settingsModel = SettingsModel(await SharedPreferences.getInstance());
    final audioModel = await makeAudioModel(settingsModel: settingsModel, musicPlayer: musicPlayer);
    await audioModel.loopMusic(GAME_MUSIC);
    verifyZeroInteractions(musicPlayer);

    await settingsModel.updateSetting(AppSetting.musicEnabled, true);
    verify(musicPlayer.play(AssetSource('music/$GAME_MUSIC'), volume: 0.5));
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
