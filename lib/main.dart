import 'package:bid_app/views/Admin/list_offre_non_vendu.dart';
import 'package:bid_app/views/Bid/Bid_ajouter.dart';
import 'package:bid_app/views/home.dart';
import 'package:flutter/material.dart';
import 'views/Admin/calendrier_bid.dart';
import 'views/Bid/Bid.dart';
import 'views/pages/List_offre_bid.dart';
import 'views/pages/planning_pages.dart';
import 'views/pages/profil_pages.dart';
import 'views/pages/widget_images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1 = client 0 = admin
  int acteur = 0;
  int currentIndex = 0;
  int currentIndexA = 0;
  final Screens = [
   //Imagepage(),
    //Imagepage(),
    HomePage(),
    BidPage(),
    Planning(),
    Profil(),
  ];
  final ScreensAdmin = [

   CalendrierBid(),
   // BidAjouter(id_offre: 1),
    Planning(),
    ListOffreA(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bid App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
        body: acteur == 0 ? ScreensAdmin[currentIndexA] : Screens[currentIndex],
        bottomNavigationBar: acteur == 0
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.deepPurple,
                selectedItemColor: Colors.white,
                selectedFontSize: 18,
                unselectedFontSize: 14,
                currentIndex: currentIndexA,
                onTap: (index1) => setState(() => currentIndexA = index1),
                items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_sharp),
                      label: "calendrier",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.playlist_add_check_outlined),
                      label: "planning",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.gavel),
                      label: "bid",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profil",
                      backgroundColor: Colors.red,
                    ),
                  ])
            : BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.deepPurple,
                selectedItemColor: Colors.white,
                selectedFontSize: 18,
                unselectedFontSize: 14,
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.gavel),
                      label: "Bid",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.playlist_add_check_outlined),
                      label: "planning",
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profil",
                      backgroundColor: Colors.red,
                    ),
                  ]),
      ),
    );
  }
}
