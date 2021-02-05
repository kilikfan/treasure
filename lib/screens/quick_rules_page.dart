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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  "Object\nComplete a quest line by managing your resources to win!\n"),
              Text(
                  "Resources\nM - Maps - Valuable resource and can also act as a wildcard"),
              Text("C - Crew - Basic resource, experienced seafarers"),
              Text("L - Landlubbers - Basic resource, inexperienced seafarers"),
              Text("F - Food - Basic resource, needed to sustain your crew"),
              Text("D - Doubloons - Basic resource, the local currency"),
              Text("I - Infamy - Special resource tracking unwanted attention"),
              Text("\nSymbols"),
              _iconText(Icons.arrow_downward, Colors.red, "Cost of an action"),
              _iconText(
                  Icons.arrow_upward, Colors.green, "Reward from an action"),
                  _iconText(
                      Icons.description, Colors.purpleAccent, "The named card will go into the discard pile, either gaining or losing quest progress"),
                  _iconText(
                      Icons.remove_red_eye, Colors.blue, "Scry (See and reorder the top cards of the deck)"),
                  _iconText(
                      Icons.replay, Colors.black, "This card will go into the discard pile"),
                  _iconText(
                      Icons.delete, Colors.black, "This card will be removed, exiled, from the deck"),
                  _iconText(
                      Icons.check, Colors.green, "You win the game!"),
                  _iconText(
                      Icons.close, Colors.red, "You lose the game!"),
            ])));
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
}
