import 'package:bid_app/views/pages/offre_ajouter.dart';
import 'package:flutter/material.dart';

import '../../models/card.api.dart';
import '../../models/card.dart';
import '../../models/offre.api.dart';
import '../../models/offre.dart';
import '../Bid/Bid.dart';
import '../widgets/offre_card_bid.dart';


class BidPage extends  StatefulWidget{
  @override
  _BidPageState   createState() =>_BidPageState();


}

class _BidPageState extends State<BidPage> {
  late List<CardM> _offres;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _offres = await CardApi.getACList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_offer_rounded),
              SizedBox(width: 10,),
              Text('Liste des bids  '),
              SizedBox(width: 10,),

            ]
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_alert), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  bidPage()));
          })
        ],
      ),
      body: Container(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _offres.length,
          itemBuilder: (context, index) {
            return OffreCardBid( off:_offres[index]);

                },
        ),

      ),
    );
  }
}

