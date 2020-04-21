import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'card/special/special_cards.dart';
import 'game_state.dart';
import 'hand.dart';

void addSpecialTopCardToDeck(GameState state){

  if (checkMutiny(state.playerHand)){
    state.deck.insert(0, Mutiny());
  }else if (checkNavyRaid(state)){
    state.deck.insert(0, NavyRaid());
  }else if (checkRavenousCrew(state.playerHand)){
    state.deck.insert(0, RavenousCrew());
  };

}

bool checkMutiny(Hand playerHand) => playerHand.cards.length > 15;

bool checkNavyRaid(GameState state) => state.playerHand.countResource(Resource.INFAMY) > 4 && state.randomiser.flipCoin();

bool checkRavenousCrew(Hand playerHand) => playerHand.countResource(Resource.FOOD) == 0;
