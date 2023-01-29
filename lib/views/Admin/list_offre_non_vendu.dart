import 'package:bid_app/views/pages/offre_ajouter.dart';
import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/offre.api.dart';
import '../../models/offre.dart';
import '../Bid/Bid_ajouter.dart';

class ListOffreA extends StatefulWidget {
  @override
  _ListOffreAState createState() => _ListOffreAState();
}

class _ListOffreAState extends State<ListOffreA> {
  late List<Offre> _offres;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _offres = await OffreApi.getListAA();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    var valueText, codeDialog;
    return showDialog(
        context: context,
        builder: (context) {
          var _textFieldController;
          return AlertDialog(
            title: Text('Offre refuser '),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Justifier"),
            ),
            actions: <Widget>[
              ElevatedButton(
                /*
                color: Colors.red,
                textColor: Colors.white,

                 */
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  // List of items in our dropdown menu
  var items = [
    'en cours',
    'accepter',
    'refuser',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.local_offer_rounded),
          SizedBox(
            width: 10,
          ),
          Text('Liste des offres admin '),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _offres.length,
                itemBuilder: (context, index) {
                  var dropdownvalue = _offres[index].status;
                  return
                      //OffreCard( off:_offres[index]);

                      Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
/*
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),*/
                              image:NetworkImage(UPLOAD_URL+_offres[index].image[0]),fit: BoxFit.cover,
                            //  image: NetworkImage(_offres[index].image),fit: BoxFit.cover,),
                          ),
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.title,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              SizedBox(width: 7),
                              Text(
                                _offres[index].titre,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  SizedBox(width: 7),
                                  Text(_offres[index].prix_directe.toString(),
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    _offres[index].prix_depart.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BidAjouter(
                                        id_offre: _offres[index].id_offre)));
                              },
                              icon: Icon(Icons.gavel),
                            )
                          ],
                        )),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
