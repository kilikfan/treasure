import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'card_viewer.dart';

class ViewDiscardPage extends StatelessWidget {
  final GameState state;

  const ViewDiscardPage(this.state);
  @override
  Widget build(BuildContext context) {
    final discard = state.discard.reversed.toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Discard Pile'),
        ),
        body: ChangeNotifierProvider.value(
            value: state,
            child: Consumer<GameState>(builder: (context, state, _) {
              return Column(children: <Widget>[
                Expanded(child: CardViewer(discard, buttons)),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close', style: TextStyle(fontSize: 30)),
                    ))
              ]);
            })));
  }

  List<Widget> buttons(context, card) {
    return [];
  }
}
