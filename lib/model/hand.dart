import 'package:treasure_of_the_high_seas/model/resource.dart';

import 'exceptions.dart';

class Hand {
  List<Resource> cards = new List<Resource>();

  Hand([List<Resource> initialCards = const []]) {
    cards.addAll(initialCards);
  }

  void addResources(List<Resource> resources) {
    cards.addAll(resources);
    cards.sort((r1, r2) => r1.index.compareTo(r2.index));
  }

  Iterable<Resource> getAllOfResource(Resource resource) => cards.where((res) => res == resource);

  int countResource(Resource resource) => getAllOfResource(resource).length;

  int size() => cards.length;

  bool canAfford(List<Resource> cost) => getRealCost(cost) != null;

  List<Resource> getRealCost(List<Resource> rawCost) {
    try {
      final handCopy = new List<Resource>.from(cards);
      return _deductResources(rawCost, handCopy);
    } catch (_) {
      return null;
    }
  }

  void deductResources(List<Resource> resources) => _deductResources(resources, cards);
  List<Resource> _deductResources(List<Resource> resources, List<Resource> playerHand) {
    final List<Resource> resourcesRemoved = [];
    for (final resource in resources) {
      if (playerHand.contains(resource)) {
        playerHand.remove(resource);
        resourcesRemoved.add(resource);
      } else if (playerHand.contains(Resource.MAP)) {
        playerHand.remove(Resource.MAP);
        resourcesRemoved.add(Resource.MAP);
      } else {
        throw new CannotAffordError();
      }
    }

    return resourcesRemoved;
  }
}