import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/main.dart';

void main() {
  group('App', () {
    testWidgets('renders appBar', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      expect(find.byType(SliverAppBar), findsOneWidget);
      expect(find.text('Movie'), findsOneWidget);
    });
  });
}
