import 'package:flutter/material.dart';

import '../../models/card.dart';
import '../../models/offre.dart';
import '../pages/carousselcard.dart';
import '../pages/offre_details.dart';
import 'offre_description_widget.dart';

class DetailCard extends StatelessWidget {
  final CardM off;
  /*
  final String title;
  final String prix_directe;
  final String cookTime;
  final String thumbnailUrl;

*/
  DetailCard({  required this.off});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /*
          Positioned(
              left: 0,
              right: 0 ,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(

                  image: DecorationImage(
                    fit: BoxFit.cover,
                   // image: AssetImage(off.image)
                    image: NetworkImage(off.image[0]),
                  ),
                  )
                ),

          ),
          */
          Positioned(child:   Column(
            children: [



              CarouselWithDotsPage(imgList: off.image),
            ],
          ),),
          Positioned(
            right: 10 ,
              child:  Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFfcf4e4),
                ),
                child: Icon( Icons.shopping_cart,
                  color:Color(0xFF756d54),
                size: 16,),

                ),
              ),
          Positioned(
            left: 20,
              right: 20,
              top: 250,
              bottom: 30,
              child: Container(
                padding: EdgeInsets.only(left:20,
                right: 20,top: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                ),
                child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                children: [
                    Text("${off.titre}",style: TextStyle(fontSize: 25, color: Colors.black), ),

                  SizedBox(width: 100,),

                        Text("${off.prix_directe} DT"
                          ,style: TextStyle(fontSize: 30, color: Colors.black), ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index)  {return Icon(Icons.star, color:Colors.yellow,size: 15,); }),
                        ),
                        SizedBox(width: 10,),
                        Text("4.5", style: TextStyle(fontSize: 12 ,color: Colors.black38),),
                        SizedBox(width: 10,),
                        Text("1287", style: TextStyle(fontSize: 12 ,color: Colors.black38),),
                        SizedBox(width: 10,),
                        Text("comments", style: TextStyle(fontSize: 12,color: Colors.black38),),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children : [

                    Text("Description : ",style: TextStyle(fontSize: 15, color: Colors.black), ),
                      ],
                    ),
                    SizedBox(height: 10,),



Expanded(
  child:   SingleChildScrollView(child:
  
              DescTextWidget(text:"${off.description}"
              /*"La France est un pays atta"
  
                            "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus ! La France est un pays attachant avec de magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus !La France est un pays attachant avec de magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus !"
             */ ),
  
                ),
),


                  ]),
          )),

/*

          Positioned(

            right: 40 ,
            left: 40,
            bottom: 10,
            child:  Container(
              width: 300,
              height: 60,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,

              ),
              padding: EdgeInsets.only(left: 100,top: 10),
              child:      Text("Buy Now",style: TextStyle(fontSize: 30, color: Colors.black),),



            ),
          ),
          */
        ],
      ),


      bottomNavigationBar: Container(
margin: EdgeInsets.only(top: 20,right: 10,left: 200),
        height:50 ,

        padding: EdgeInsets.only(top:10,bottom: 10,
        left: 10,right: 10),
        decoration: BoxDecoration(
      color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
      )
      ),
        child:  Row( children : [
          Expanded(child:
          Text("Commander  ",style: TextStyle(fontSize: 25, color: Colors.black),),
          ),
  ])

      ),

      
    );}}

