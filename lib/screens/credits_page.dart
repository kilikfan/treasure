import 'package:flutter/material.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.start, children: [])),
        ));
  }
}
