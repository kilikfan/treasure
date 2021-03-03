import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/screens/text_utils.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Credits'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: new SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                heading('Development'),
                    SizedBox(height: 10),
                iconText(Icons.anchor, Colors.black, 'Mark Fisher'),
                iconText(Icons.anchor, Colors.black, 'Alex Burlton'),
                iconText(Icons.anchor, Colors.black, 'Jon Masson'),
                iconText(Icons.anchor, Colors.black, 'Samuel Bradley'),
                    SizedBox(height: 50),
                    heading('Music / SFX'),
                    SizedBox(height: 10),
                    iconText(Icons.music_note, Colors.black, 'Shane Ivers - "The Buccaneer\'s Haul" \n(https://www.silvermansound.com)')
              ])),
        ));
  }
}
