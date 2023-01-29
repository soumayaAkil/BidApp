// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bid_app/views/Bid/Bid_ajouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bid_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Invalide 0', (WidgetTester tester) async {
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
        home: BidAjouter(
          id_offre: 1,
        )));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    final Finder clavier_icon = find.byIcon(Icons.keyboard);
    int Invalid = 0;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Invalid.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Invalid.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));


  });

  testWidgets('Invalide -1', (WidgetTester tester) async {
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
        home: BidAjouter(
          id_offre: 1,
        )));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    int Invalid = -1;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Invalid.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Invalid.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));
  });
  testWidgets('Invalide -100', (WidgetTester tester) async {

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
        ),home: BidAjouter(id_offre: 1,)));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    int Invalid = -100;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Invalid.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Invalid.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));
  });
  testWidgets('Valide 1', (WidgetTester tester) async {
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
        ),home: BidAjouter(id_offre: 1,)));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    int Valide = 1;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Valide.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Valide.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));
  });
  testWidgets('Valide 2', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
        title: 'Bid App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black),
          ),
        ),home: BidAjouter(id_offre: 1,)));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    int Valide = 2;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Valide.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Valide.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));



  });
  testWidgets('Valide 13', (WidgetTester tester) async {

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
        ),home: BidAjouter(id_offre: 1,)));
    // await tester.pageBack();
    final Finder zonetext = find.byType(TextField);
    final Finder submit = find.text("submit");
    final Finder cal = find.byIcon(Icons.date_range_outlined);
    final Finder time = find.byIcon(Icons.timer);
    int Valide = 13;

    expect(cal, findsOneWidget);
    await tester.ensureVisible(cal);
    await tester.tap(cal);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("15"));
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));
    expect(time, findsOneWidget);
    await tester.ensureVisible(time);
    await tester.tap(time);
    await Future.delayed(Duration(seconds: 3));
    await tester.tap(find.text("OK"));
    await Future.delayed(Duration(seconds: 3));

    await tester.enterText(zonetext, Valide.toString());
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(Valide.toString()), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text("submit"), findsOneWidget);


    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(ElevatedButton));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text("1500"), findsOneWidget);
    await Future.delayed(Duration(seconds: 3));
  });



}




/*
    expect(clavier_icon, findsOneWidget);
    await tester.ensureVisible(clavier_icon);
    await tester.tap(clavier_icon);
    await Future.delayed(Duration(seconds: 3));

    expect(zoneheure, findsOneWidget);

    await tester.ensureVisible(zoneheure);
    await tester.tap(zoneheure);
    await tester.enterText(zoneheure, "2");
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
*/
