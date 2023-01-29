import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/offre_description_widget.dart';
import 'carousselcard.dart';

import 'package:flutter/material.dart';

import '../../models/card.dart';
import '../../models/offre.dart';
import '../pages/offre_details.dart';


class Imagepage extends StatelessWidget {
  //final CardM off;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(child:   Column(
          children: [



          CarouselWithDotsPage(imgList: imgList),
        ],
      ),),

          Positioned(
            right: 10 ,
            top: 40,
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
                          Text("vv",style: TextStyle(fontSize: 25, color: Colors.black), ),

                          SizedBox(width: 150,),

                          Text("200 DT"
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

                        DescTextWidget(text:"hhhhhhhhhhhhhhhhhhhhhhhhhh"
                          /*"La France est un pays atta"

                            "chant avec de magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie.magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus ! La France est un pays attachant avec de magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus !La France est un pays attachant avec de magnifiques monuments et une savoureuse gastronomie. C'est pourquoi parler français lors de ses voyages ou pour nouer des relations professionnelles demeure un vrai plus !"
             */ ),

                        ),
                      ),


                    ]),
              )),

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

