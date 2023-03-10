import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bid_app/main.dart'  as app;
void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle();
    final Finder button = find.byIcon(Icons.timer);
    //do


    //test
    expect(find.byIcon(Icons.calendar_month_sharp), findsOneWidget);

  });
}



/*
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/