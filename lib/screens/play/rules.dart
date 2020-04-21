import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/util/load_rules.dart';

class RulesPage extends StatelessWidget {
  RulesPage({Key key, this.title}) : super(key: key);

  final String title;
  Future<String> callReadRules() => Future.delayed(Duration(seconds: 0), () => readRules());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: callReadRules(),
        builder: (BuildContext context, AsyncSnapshot<String> text) {
          return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: new SingleChildScrollView(
                    child: new Text(
                      text.data,
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    )
                ),
              )
          );
        });
  }
}

Text loadSnapshot(AsyncSnapshot<String> text){
  switch (text.connectionState) {
    case ConnectionState.waiting: return new Text('Loading...');
    default:
      if (text.hasError)
        return new Text('Error: ${text.error}');
      else
        return new Text('${text.data}');
  }
}