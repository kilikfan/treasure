import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';

class RulesPage extends StatelessWidget {
  const RulesPage(this._loader, {Key key}) : super(key: key);

  final ResourceLoader _loader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _loader.readTextResource("assets/text/rules.txt"),
        builder: (BuildContext context, AsyncSnapshot<String> text) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Rules'),
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: new SingleChildScrollView(
                    child: new Text(
                      text.data != null ? text.data : "",
                      key: Key('rules_content'),
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
