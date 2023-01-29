import 'package:bid_app/models/card.api.dart';
import 'package:bid_app/views/pages/offre_ajouter.dart';
import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/card.dart';
import '../../models/offre.api.dart';
import '../../models/offre.dart';
import '../Bid/Bid_ajouter.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  late List<CardM> _cards;
  bool _isLoading = true;
  var desc_refuser = "";
  var cancel=false;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _cards = await CardApi.getListAENCours();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    var valueText;
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
                     cancel=true;
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    print("cliquuuuuuuuuuuuuue");
                    desc_refuser = valueText;
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
    'choisir',
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
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 10),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  var dropdownvalue ='choisir';
                  print(_cards[index].image[0]["url"]);
                      //_offres[index].status;
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
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
/*
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),*/
                              image: NetworkImage(UPLOAD_URL+_cards[index].image[0]["url"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              SizedBox(width: 2),

                              Text(
                                _cards[index].titre,
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
                                  Text(_cards[index].prix_directe.toString(),
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
                                    _cards[index].prix_depart.toString(),
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
                            DropdownButton(
                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() async {

                                   dropdownvalue=newValue!;

                                  if (newValue == "refuser") {
                                    await _displayTextInputDialog(context);
                                  }
                                  if((cancel==false )& (newValue!="choisir"))
                                  {
                                  await CardApi.PutSatusO(
                                      _cards[index].id_offre,
                                      newValue!,
                                      desc_refuser);
                                  getRecipes();
                                }

                                });
                              },
                            ),
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
