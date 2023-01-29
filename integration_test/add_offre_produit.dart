import 'package:bid_app/views/Bid/Bid.dart';
import 'package:bid_app/views/Bid/Bid_ajouter.dart';
import 'package:bid_app/views/pages/offre_ajouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bid_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Bid valide  100', (WidgetTester tester) async {
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
        home: OffreAjouter(
        )));
    // await tester.pageBack();
    final Finder titre = find.byKey(Key("titre"));
    final Finder prixDirect = find.byKey(Key("prixDiret"));
    final Finder prixDepart = find.byKey(Key("prixDepart"));
    final Finder description = find.byKey(Key("description"));
    final Finder photoIcon = find.byIcon(Icons.add_a_photo);
    String TitreText="livre";
    String DescriptionText="grand livre";
    String prixDepartText="105";
    String prixDirectText="2000";

//titre
    await tester.enterText(titre, TitreText);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(TitreText), findsOneWidget);
    await tester.pumpAndSettle();

    expect(titre, findsOneWidget);
// description
    await tester.enterText(description, DescriptionText);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(DescriptionText), findsOneWidget);
    await tester.pumpAndSettle();

    //prix direct
    await tester.enterText(prixDirect, prixDirectText);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(prixDirectText), findsOneWidget);
    await tester.pumpAndSettle();

    //prix depart
    await tester.enterText(prixDepart,prixDepartText );
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    expect(find.text(prixDepartText), findsOneWidget);
    await tester.pumpAndSettle();


    await tester.pumpAndSettle();
    await tester.ensureVisible(photoIcon);
    await tester.tap(photoIcon);
    await tester.pumpAndSettle();


    await Future.delayed(Duration(seconds: 5));



  });
}