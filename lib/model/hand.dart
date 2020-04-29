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

  bool canAfford(List<Resource> cost) {
    try {
      final handCopy = new List<Resource>.from(cards);
      _deductResources(cost, handCopy);
      return true;
    } catch (_) {
      return false;
    }
  }

  void deductResources(List<Resource> resources) => _deductResources(resources, cards);
  void _deductResources(List<Resource> resources, List<Resource> playerHand) {
    resources.forEach((resource) => {
      if (playerHand.contains(resource)) {
        playerHand.remove(resource)
      } else if (playerHand.contains(Resource.MAP)) {
        playerHand.remove(Resource.MAP)
      } else {
        throw new CannotAffordError()
      }
    });
  }
}