import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class Scurvy extends Card {
  const Scurvy() : super('Scurvy!');

  @override
  List<CardAction> getActions(GameState state) {
    final allCrew = state.playerHand.getAllOfResource(Resource.CREW);
    final halfCrew = allCrew.take((allCrew.length / 2).ceil()).toList();

    final discardAction =
        DiscardAction(description: 'Find port to see a doctor.');
    discardAction.enabled = allCrew.isEmpty;

    return [
      TradeAction('Oranges all round!', [Resource.FOOD, Resource.FOOD], [],
          soundEffect: SFX_APPLE),
      TradeAction('Weevils too!', halfCrew, [], soundEffect: SFX_DEATH),
      discardAction
    ];
  }
}
