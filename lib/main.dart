import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/audio/audio_constants.dart';
import 'model/audio/audio_model.dart';
import 'model/settings/settings_model.dart';
import 'screens/app.dart';

void main() => _buildAndRunApp();

Future<void> _buildAndRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await _buildApp());
}

Future<Widget> _buildApp() async {
  final prefs = await SharedPreferences.getInstance();
  final settingsModel = SettingsModel(prefs);
  final musicPlayer = AudioPlayer();
  final soundPlayer = AudioPlayer();
  final audioModel = AudioModel(settingsModel, musicPlayer, soundPlayer);

  await audioModel.loopMusic(MENU_MUSIC);

  return MultiProvider(providers: [
    ChangeNotifierProvider<SettingsModel>.value(value: settingsModel),
    Provider<AudioModel>.value(value: audioModel)
  ], child: TreasureApp(audioModel));
}
