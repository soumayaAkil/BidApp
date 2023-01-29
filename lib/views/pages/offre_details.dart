import 'package:flutter/material.dart';
import '../../models/card.dart';

import '../../models/offre.dart';
import '../../models/offre.api.dart';
import '../widgets/detailCard.dart';
import '../widgets/offre_card.dart';
class OffreDetail extends  StatefulWidget{
   final CardM off;


  const OffreDetail( {required this.off});
  @override
  _HomePageState   createState() =>_HomePageState();


}

class _HomePageState extends State<OffreDetail> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

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
                Text('Détail  ${widget.off.titre}'),


              ]
          ),
        ),
        body: DetailCard( off:widget.off),
          
        );
  }
}
