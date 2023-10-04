import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';

class RulesPage extends StatelessWidget {
  const RulesPage(this._loader, {Key key = const Key('Rules')})
      : super(key: key);

  final ResourceLoader _loader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _loader.readTextResource('assets/text/rules.txt'),
        builder: (BuildContext context, AsyncSnapshot<String> text) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Rules'),
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    child: Text(
                  text.data != null ? text.data! : '',
                  key: const Key('rules_content'),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                )),
              ));
        });
  }
}
