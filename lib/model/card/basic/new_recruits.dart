import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class NewRecruits extends Card {
    const NewRecruits() : super('New Recruits');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('Train some men.',[Resource.LANDLUBBER, Resource.LANDLUBBER], [Resource.CREW, Resource.CREW], soundEffect: SFX_MARCHING),
      TradeAction('Steal a crew.', [], [Resource.CREW, Resource.CREW, Resource.INFAMY, Resource.INFAMY], soundEffect: SFX_KIDNAP),
      TradeAction('Buy a crew.', [Resource.DOUBLOON, Resource.DOUBLOON], [Resource.CREW, Resource.CREW], soundEffect: SFX_COINS),
    ];
  }
}
