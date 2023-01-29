import 'package:bid_app/views/Bid/Bid.dart';
import 'package:bid_app/views/Bid/Bid_ajouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bid_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Bid valide 1600 >1500', (WidgetTester tester) async {
    //setup
    //app.main();
    await tester.pumpWidget(MaterialApp(
        title: 'Bid App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black),
          ),
        ),
        home: bidPage(
        )));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("Proposer ");
    int Valide = 1600;


    await tester.enterText(zonetext, Valide.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Valide.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(submit, findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();


    await Future.delayed(Duration(seconds: 5));
    expect(find.text("Prix actuel : "+Valide.toString()+" Dt \n  "), findsOneWidget);

  });
  testWidgets('Bid invalide 1000 <1600', (WidgetTester tester) async {
    //setup
    //app.main();
    await tester.pumpWidget(MaterialApp(
        title: 'Bid App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black),
          ),
        ),
        home: bidPage(
        )));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("Proposer ");
    int inValide = 1000;


    await tester.enterText(zonetext, inValide.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(inValide.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(submit, findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();


    await Future.delayed(Duration(seconds: 5));
    expect(find.text("Prix actuel : "+inValide.toString()+" Dt \n  "), findsOneWidget);

  });
}