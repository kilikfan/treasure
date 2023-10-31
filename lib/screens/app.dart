import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import './main_menu/main_menu_page.dart';

class TreasureApp extends StatefulWidget {
  final AudioModel _audioModel;

  const TreasureApp(this._audioModel);

  @override
  State<StatefulWidget> createState() => TreasureState(_audioModel);
}

class TreasureState extends State<TreasureApp> with WidgetsBindingObserver {
  final AudioModel _audioModel;

  TreasureState(this._audioModel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure of the High Seas',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        hintColor: Colors.lightGreen,
      ),
      home: MainMenuPage(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _audioModel.resumeMusic();
    } else {
      _audioModel.pauseMusic();
    }
  }
}
