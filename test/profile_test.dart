import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cl/screens/profiles/profiles.dart';

void main() {
  testWidgets(
    "profile widget testing",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Profiles()));

      final titleFinder = find.text('About');

      expect(titleFinder, findsOneWidget);
    },
  );
}
