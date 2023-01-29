import 'package:bid_app/models/bid_detail.dart';
import 'package:flutter/material.dart';

import '../../models/bid_detail_api.dart';
import '../../models/card.dart';
import '../../models/offre.dart';
import '../../models/offre.api.dart';
import '../widgets/detailCard.dart';
import '../widgets/detailCardBid.dart';
import '../widgets/offre_card.dart';
class OffreDetailBid extends  StatefulWidget{
  //final int id_off;
  final  List<BidDetail> Bids;


  const OffreDetailBid( {required this.Bids});
  @override
  _OffreDetailBidState   createState() =>_OffreDetailBidState();


}

class _OffreDetailBidState extends State<OffreDetailBid> {
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();

//    getRecipes();
  }
/*
  Future<void> getRecipes() async {
    Bids = await BidDetailApi.getListBid(widget.id_off);
    setState(() {
      _isLoading = false;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_offer_rounded),
              SizedBox(width: 10,),
              Text('Détail ${widget.Bids[0].titre}'),


            ]
        ),
      ),
      body: DetailCardBid( Bid: widget.Bids[0]),

    );
  }
}
