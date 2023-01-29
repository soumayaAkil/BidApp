import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/card.dart';
import '../../models/offre.dart';
import '../pages/offre_ajouter.dart';
import '../pages/offre_details.dart';

class OffreCard extends StatelessWidget {
  final CardM off;
  /*
  final String title;
  final String prix_directe;
  final String prix_directe;
  final String cookTime;
  final String thumbnailUrl;

*/
  OffreCard({  required this.off});
  @override
  Widget build(BuildContext context) {
    print(off.image[0]);
    print("fff");
    return InkWell(
      onTap: (){Navigator.of(context)
        .push(
      MaterialPageRoute(builder: (context) => OffreDetail(off:off)));
          },
      child:Container(

      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,

      decoration: BoxDecoration(
        border: Border.all(
            color:   Colors.white10,
            width: 8.0,
            style: BorderStyle.solid),
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
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
                      Text(off.prix_directe.toString(),style: TextStyle(color: Colors.white,fontSize: 16),),
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
                        Icons.title,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(off.titre,style: TextStyle(color: Colors.white,fontSize: 16),),
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
}