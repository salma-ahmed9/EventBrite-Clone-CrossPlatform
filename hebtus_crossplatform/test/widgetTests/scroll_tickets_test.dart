import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info.dart';
import 'package:hebtus_crossplatform/screens/Creator/Tickets/tickets_assign.dart';

void main() {
  group("scrollTestingWidget", () {
    testWidgets("should scroll ", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Tickets()));

      await tester.drag(find.byType(Scaffold), const Offset(0, -200));
      await tester.pump();
      final firstField = find.text("Refresh");
      expect(firstField, findsWidgets);
    });
  });
}
