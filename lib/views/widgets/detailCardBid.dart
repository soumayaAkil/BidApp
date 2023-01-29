import 'package:flutter/material.dart';
import '../../config.dart';
import '../../models/bid.api.dart';
import '../../models/bid_detail.dart';
import '../../models/card.dart';

import '../../models/offre.dart';
import '../pages/carousselcard.dart';
import '../pages/offre_details.dart';
import 'offre_description_widget.dart';

class DetailCardBid extends StatefulWidget {
  final BidDetail Bid;

  /*
  final String title;
  final String prix_directe;
  final String cookTime;
  final String thumbnailUrl;
  final String thumbnailUrl;

*/

  DetailCardBid({required this.Bid});
  @override
  _DetailCardBidState createState() => _DetailCardBidState();
}

class _DetailCardBidState extends State<DetailCardBid> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  Future<void> _displayConfirmDialog(BuildContext context) async {
    var valueText;
    return showDialog(
        context: context,
        builder: (context) {
          final _textFieldController= TextEditingController();
          return AlertDialog(
            title: Text('Saisir code :  '),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //position
              mainAxisSize: MainAxisSize.min,
              // wrap content in flutter
              children: <Widget>[
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "code de confirmation"),
                ),
              ],
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
                    BidApi.verifierCode(1, 1, _textFieldController.text);
                    /*
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => =()));
                    */
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    var valueText;
    return showDialog(
        context: context,
        builder: (context) {
          final _textFieldControllerN = TextEditingController();
          return AlertDialog(
            title: Text('Confirmer inscription !  '),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //position
              mainAxisSize: MainAxisSize.min,
              // wrap content in flutter
              children: <Widget>[
                Text("Frais d'inscription: " "${widget.Bid.frais_inscrit}",),
                SizedBox(height: 20),
                TextField(
                  /*
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                    });
                  },
                  */
                  keyboardType: TextInputType.number,
                  controller: _textFieldControllerN,
                  decoration: InputDecoration(hintText: "numéro de téléphone"),
                ),
              ],
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
                    Navigator.pop(context);
                    BidApi.saveUser(1, 1, _textFieldControllerN.text);
                    print("eeeeeeeeeeeeeeeeeeee");
                    print(_textFieldControllerN.text);
                    _displayConfirmDialog(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(child:   Column(
            children: [



              CarouselWithDotsPage(imgList: widget.Bid.image),
            ],
          ),),

          // image: NetworkImage(UPLOAD_URL+widget.Bid.image[0]["url"]),
          Positioned(
            right: 10,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFfcf4e4),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Color(0xFF756d54),
                size: 20,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 200,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: Row(children: [
                Text(
                  "Prix départ : ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "${widget.Bid.prix_depart}",
                  style: TextStyle(fontSize: 20),
                ),
              ]),
            ),
          ),
          Positioned(
              left: 20,
              right: 20,
              top: 250,
              bottom: 20,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            //   "01/11/2022 12:30 H",
                            "${widget.Bid.date}  " "${widget.Bid.heure}H",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.Bid.titre}",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4.5",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1287",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "comments",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Frais d'inscription :",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${widget.Bid.frais_inscrit}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Description : ",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: DescTextWidget(
                              text: "${widget.Bid.description} "

                              //"chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie."

                              ),
                        ),
                      ),
                    ]),
              )),
          Positioned(
            left: 10,
            bottom: 0,
            child: InkWell(
              onTap: () {
                _displayTextInputDialog(context);
              }, // Handle your callback
              child: Container(
                padding: EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                child: Row(children: [
                  Text(
                "${widget.Bid.nb_inscrit}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Icon(
                    Icons.person_add,
                    color: Colors.yellow,
                    size: 20,
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {}, // Handle your callback
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 10, left: 200),
          height: 80,
          padding: EdgeInsets.only(top: 10, left: 20, right: 10),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Column(children: [
            Row(children: [
              Icon(
                Icons.shopping_cart_checkout,
                color: Colors.yellow,
                size: 30,
              ),
              Text(
                " ${widget.Bid.prix_directe} DT",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ]),
            Text(
              "Commander",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
