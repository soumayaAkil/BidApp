import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/bid_detail.dart';
import '../../models/card.dart';
import '../../models/offre.dart';
import '../pages/offre_ajouter.dart';
import '../pages/offre_detail_bid.dart';
import '../../models/bid_detail_api.dart';
import '../pages/offre_details.dart';

class OffreCardBid extends StatelessWidget {
  final CardM off;
  final int x=1 ;
  /*
  final String title;
  final String prix_directe;
  final String cookTime;
  final String thumbnailUrl;

*/
  OffreCardBid({  required this.off});
  late List<BidDetail> Bids;
  @override
  Widget build(BuildContext context) {

    return   InkWell(
      onTap: ()async{

         getRecipes();
         await Future.delayed(Duration(milliseconds: 100));
        Navigator.of(context)
          .push(
          MaterialPageRoute(builder: (context) => OffreDetailBid(Bids:Bids)));
      },
      child:Container(

        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,

        decoration: BoxDecoration(

          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color:    ID_CLIENT == off.id_client ?   Colors.red: Colors.white10,
                width: 6.0,
                style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(

              color: Colors.black.withOpacity(0.9),
              offset: Offset(
                0.0,
                10.0,

              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image:
          DecorationImage(
/*
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),*/
            image: NetworkImage(UPLOAD_URL+off.image[0]),
            fit: BoxFit.fill,


          ),
        ),
        child: Stack(

          children: [

            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(off.prix_directe.toString(),style: TextStyle( color: Colors.white,fontSize: 16),),
                      ],
                    ),
                  ),

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
                          Icons.fast_forward,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 2),
                        Text("prix d'enchères ${off.prix_depart}",style: TextStyle( color: Colors.white,fontSize: 16),),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),

          ],
        ),


      ),);
  }

  Future<void> getRecipes() async {
    Bids = await BidDetailApi.getListBid(off.id_offre);
    print("object");
    /*setState(() {
      _isLoading = false;
    });
    */
  }
}