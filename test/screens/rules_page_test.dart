import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treasure_of_the_high_seas/screens/rules_page.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';

import '../mocks.dart';
import '../test_utils.dart';

void main() {
  testWidgets('should initialise with an empty string while rules text is loaded', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RulesPage(const ResourceLoader())));
    final rulesText = tester.widget<Text>(find.byKey(Key("rules_content")));
    expect(rulesText.data, "");
  });

  testWidgets('should load the right resource, and display the rules text once loaded', (WidgetTester tester) async {
    final mockResourceLoader = MockResourceLoader();
    when(mockResourceLoader.readTextResource(any)).thenAnswer((_) => Future.value("Resource text"));

    await tester.launchWidget(child: RulesPage(mockResourceLoader));

    final rulesText = tester.widget<Text>(find.byKey(Key("rules_content")));
    expect(rulesText.data, "Resource text");

    verify(mockResourceLoader.readTextResource("assets/text/rules.txt"));
  });
}