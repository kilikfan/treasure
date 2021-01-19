import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/settings/settings_model.dart';
import 'screens/app.dart';

void main() => _buildAndRunApp();

Future<void> _buildAndRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await _buildApp());
}

Future<Widget> _buildApp() async {
  final prefs = await SharedPreferences.getInstance();
  return MultiProvider(providers: [
    ChangeNotifierProvider<SettingsModel>.value(value: SettingsModel(prefs))
  ], child: TreasureApp());
}
