import 'package:bid_app/views/pages/offre_ajouter.dart';
import 'package:flutter/material.dart';

import '../models/card.api.dart';
import '../models/card.dart';
import '../models/offre.api.dart';
import '../models/offre.dart';
import 'widgets/offre_card.dart';
class HomePage extends  StatefulWidget{
  @override
  _HomePageState   createState() =>_HomePageState();


}

class _HomePageState extends State<HomePage> {
  late List<CardM> _offres;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _offres = await CardApi.getAll();
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
              Text('Liste des offres  '),
              SizedBox(width: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,

                ),

                onPressed: (){Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => OffreAjouter()));
                },
                child: Text("+",style: TextStyle(fontSize: 25),),

              )
            ]
        ),
      ),
        body: Container(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: _offres.length,
            itemBuilder: (context, index) {
              return OffreCard( off:_offres[index]);

;          },
          ),

        ),
    );
  }
}


/*Container(
        margin: EdgeInsets.only(top: 10,),


        padding: EdgeInsets.only(bottom: 10,left: 40
            ),
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(30),


        ),
        child:  InkWell(
          onTap: (


              ){

            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => OffreAjouter()));
          },
          child:

          Text("+",style: TextStyle(fontSize: 28, color: Colors.black),),

        )

    ),
      */
