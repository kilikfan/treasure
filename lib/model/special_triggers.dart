import 'dart:math';

import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'hand.dart';

bool checkMutiny(Hand playerHand) {

  // Mutiny next card if resource count over 15
  return playerHand.cards.length > 15;

}

bool checkNavyRaid(Hand playerHand){

  // Navy Raid next card if not Mutiny and >4 infamy and you toss a heads
  // TODO - ran into same problem with testing this
  Random random = new Random();
  return playerHand.countResource(Resource.INFAMY) > 4 && random.nextBool();

}

bool checkRavenousCrew(Hand playerHand){

  // Ravenous Crew next card if not Mutiny or Navy Raid and zero food
  return playerHand.countResource(Resource.FOOD) == 0;

}