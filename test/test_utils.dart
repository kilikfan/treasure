import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart' as ModelCard;
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/settings/settings_model.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/main_menu_page.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

import 'model/audio/audio_model_test.mocks.dart';

GameState makeGameState(
    {List<ModelCard.Card>? deck,
    Randomiser randomiser = const Randomiser(),
    List<Resource> playerHand = INITIAL_RESOURCES,
    ModelCard.Card? currentCard}) {
  final deckToUse =
      deck != null ? deck : [const PlunderAWreck(), const ARivalShip()];
  final state = GameState(randomiser, deckToUse, playerHand);
  state.currentCard = currentCard;
  return state;
}

extension WidgetTesterExtension on WidgetTester {
  Future<void> launchWidget(
      {Widget? child,
      GameState? state,
      AudioModel? audioModel,
      SettingsModel? settingsModel}) async {
    final prefs = await runAsync(() async => SharedPreferences.getInstance());

    final app = MultiProvider(providers: [
      ChangeNotifierProvider<GameState>.value(value: state ?? makeGameState()),
      ChangeNotifierProvider<SettingsModel>.value(
          value: settingsModel ?? SettingsModel(prefs!)),
      Provider<AudioModel>.value(value: audioModel ?? MockAudioModel())
    ], child: MaterialApp(home: child));

    await pumpWidget(app);
    await pumpAndSettle();
  }
}

Future<void> launchGameFromMenu(WidgetTester tester,
    {AudioModel? audioModel, SettingsModel? settingsModel}) async {
  if (settingsModel == null) {
    settingsModel = SettingsModel(await SharedPreferences.getInstance());
  }

  await tester.launchWidget(
      child: MainMenuPage(),
      audioModel: audioModel ?? MockAudioModel(),
      settingsModel: settingsModel);

  final button1Finder = find.text('Play');
  expect(button1Finder, findsOneWidget);
  await tester.tap(button1Finder);
  await tester.pumpAndSettle();
}

Future<void> launchGameFromMenuMock(WidgetTester tester,
    {MockAudioModel? audioModel}) async {
  SharedPreferences.setMockInitialValues({});
  await launchGameFromMenu(tester, audioModel: audioModel);
  reset(audioModel);
}
