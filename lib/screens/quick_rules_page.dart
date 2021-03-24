import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/screens/text_utils.dart';

class QuickRulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quick Rules'),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: new SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  plainText(
                      'Object\nComplete a quest line by managing your resources to win!\n'),
                  plainText(
                      'Resources\nM - Maps - Valuable resource and can also act as a wildcard'),
                  plainText('C - Crew - Basic resource, experienced seafarers'),
                  plainText(
                      'L - Landlubbers - Basic resource, inexperienced seafarers'),
                  plainText(
                      'F - Food - Basic resource, needed to sustain your crew'),
                  plainText(
                      'D - Doubloons - Basic resource, the local currency'),
                  plainText(
                      'I - Infamy - Special resource tracking unwanted attention'),
                  plainText('\nSymbols'),
                  iconText(
                      Icons.arrow_downward, Colors.red, 'Cost of an action'),
                  iconText(Icons.arrow_upward, Colors.green,
                      'Reward from an action'),
                  iconText(Icons.arrow_forward, Colors.purpleAccent,
                      'The named card will go into the discard pile, gaining quest progress'),
                  iconText(Icons.arrow_back, Colors.purpleAccent,
                      'The named card will go into the discard pile, losing quest progress'),
                  iconText(Icons.remove_red_eye, Colors.blue,
                      'Scry (See and reorder the top cards of the deck)'),
                  iconText(Icons.replay, Colors.black,
                      'This card will go into the discard pile'),
                  iconText(Icons.delete, Colors.black,
                      'This card will be removed, exiled, from the deck'),
                  iconText(Icons.check, Colors.green, 'You win the game!'),
                  iconText(Icons.close, Colors.red, 'You lose the game!'),
                ]))));
  }
}
