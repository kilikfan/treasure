import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/model/card/action/card_action.dart';

class ExileAction implements CardAction {
  final List<Resource> reward;

  @override
  List<Resource> get cost => new List<Resource>();

  @override
  String get description => "Exile this card.";

  ExileAction(this.reward);

  @override
  void performAction(GameState state) {
    state.addResources(reward);
    state.exileCurrentCard();
  }



}