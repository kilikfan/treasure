import 'package:flutter/material.dart';

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
                  _plainText(
                      "Object\nComplete a quest line by managing your resources to win!\n"),
                  _plainText(
                      "Resources\nM - Maps - Valuable resource and can also act as a wildcard"),
                  _plainText(
                      "C - Crew - Basic resource, experienced seafarers"),
                  _plainText(
                      "L - Landlubbers - Basic resource, inexperienced seafarers"),
                  _plainText(
                      "F - Food - Basic resource, needed to sustain your crew"),
                  _plainText(
                      "D - Doubloons - Basic resource, the local currency"),
                  _plainText(
                      "I - Infamy - Special resource tracking unwanted attention"),
                  _plainText("\nSymbols"),
                  _iconText(
                      Icons.arrow_downward, Colors.red, "Cost of an action"),
                  _iconText(Icons.arrow_upward, Colors.green,
                      "Reward from an action"),
                  _iconText(Icons.arrow_forward, Colors.purpleAccent,
                      "The named card will go into the discard pile, gaining quest progress"),
                  _iconText(Icons.arrow_back, Colors.purpleAccent,
                      "The named card will go into the discard pile, losing quest progress"),
                  _iconText(Icons.remove_red_eye, Colors.blue,
                      "Scry (See and reorder the top cards of the deck)"),
                  _iconText(Icons.replay, Colors.black,
                      "This card will go into the discard pile"),
                  _iconText(Icons.delete, Colors.black,
                      "This card will be removed, exiled, from the deck"),
                  _iconText(Icons.check, Colors.green, "You win the game!"),
                  _iconText(Icons.close, Colors.red, "You lose the game!"),
                ]))));
  }

  Widget _iconText(IconData icon, Color iconColor, String text) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, color: iconColor),
          ),
          TextSpan(
            text: " - " + text,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _plainText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
