import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/screens/rules_page.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';
import 'package:mockito/annotations.dart';

import '../test_utils.dart';

@GenerateNiceMocks([MockSpec<ResourceLoader>()])
import 'rules_page_test.mocks.dart';

void main() {
  testWidgets(
      'should initialise with an empty string while rules text is loaded',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: RulesPage(ResourceLoader())));
    final rulesText =
        tester.widget<Text>(find.byKey(const Key('rules_content')));
    expect(rulesText.data, '');
  });

  testWidgets(
      'should load the right resource, and display the rules text once loaded',
      (WidgetTester tester) async {
    final mockResourceLoader = MockResourceLoader();
    when(mockResourceLoader.readTextResource(any))
        .thenAnswer((_) => Future.value('Resource text'));

    SharedPreferences.setMockInitialValues({});
    await tester.launchWidget(child: RulesPage(mockResourceLoader));

    final rulesText =
        tester.widget<Text>(find.byKey(const Key('rules_content')));
    expect(rulesText.data, 'Resource text');

    verify(mockResourceLoader.readTextResource('assets/text/rules.txt'));
  });
}
