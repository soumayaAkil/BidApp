

import 'package:flutter/material.dart';


class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ScreenProfil createState() => _ScreenProfil();
}

class _ScreenProfil extends State<Profil> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  var name="Sami", number="22125475",prenom="Berrajah";
  var email="samiberrajah@gmail.com";
  bool isSignIn = false;

  getPref() async {



  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          elevation: 20.0,
          shadowColor: Colors.pink,
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: profileView());
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Container(height: 24, width: 24),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child:Image.asset(
                    "images/homme.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.purple, Color.fromRGBO(0, 41, 95, 50)])),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Icon(Icons.person, color: Colors.white70),
                              Text(
                                "   " + name,
                                style: TextStyle(color: Colors.white70),
                              )
                            ])),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Icon(Icons.person, color: Colors.white70),
                              Text(
                                "   " + prenom,
                                style: TextStyle(color: Colors.white70),
                              )
                            ])),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Icon(Icons.email, color: Colors.white70),
                              Text(
                                "   " + email,
                                style: TextStyle(color: Colors.white70),
                              )
                            ])),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Icon(Icons.phone, color: Colors.white70),
                              Text(
                                "   " + number,
                                style: TextStyle(color: Colors.white70),
                              )
                            ])),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),

                ],
              ),
            ))
      ],
    );
  }
}
