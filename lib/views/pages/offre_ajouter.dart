import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';
import '../../models/offre.dart';
import '../../models/offre.api.dart';
import '../widgets/detailCard.dart';
import '../widgets/offre_card.dart';
import 'upload_image.dart';
import '../../models/offre.api.dart';

class OffreAjouter extends StatefulWidget {
  @override
  _OffreAjouterState createState() => _OffreAjouterState();
}

class _OffreAjouterState extends State<OffreAjouter> {
  bool _isLoading = true;

  GlobalKey<FormState> _globalFormKey = new GlobalKey<FormState>();


  String titreController = "";
  String descController = "";
  String prixdepartController = "";
  String prixdirecteController = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.local_offer_rounded),
          SizedBox(
            width: 10,
          ),
          Text('Ajouter offre'),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _globalFormKey,
              child:Column(
                children: <Widget>[
              TextFormField(
                key:Key("titre"),
                onFieldSubmitted: (input) => {titreController = input! },
                validator: (titreController) {
                  if (titreController!.isEmpty) return 'Titre obligatoire ';
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "titre",
                ),

              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                key:Key("description"),
                onFieldSubmitted: (input) => {descController = input! },
                validator: (descController) {
                  return null;
                },
                maxLines: 8,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  labelStyle: TextStyle(),
                  alignLabelWithHint: true,
                ),

              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                key:Key("prixDiret"),
                onFieldSubmitted: (input) => {prixdirecteController = input! },
                validator: (prixdirecteController) {
                  if (prixdirecteController!.isEmpty) return 'Prix obligatoire ';
                  if (int.tryParse(prixdirecteController) == null)
                    return 'prix sauf des chiffres';
                  if (int.tryParse(prixdirecteController)! < 1)
                    return 'pas de prix négative';
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Prix directe",
                ),

              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                key:Key("prixDepart"),
                onFieldSubmitted: (input) => {prixdepartController = input! },
                validator: (prixdepartController) {
                  if (prixdepartController!.isEmpty) return 'Prix obligatoire ';
                  if (int.tryParse(prixdepartController) == null)
                    return 'prix sauf des chiffres';
                  if (int.tryParse(prixdepartController)! < 1)
                    return 'pas de prix négative';
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Prix départ",
                ),

              ),
              SizedBox(height: 40),
             /* ElevatedButton(
                  onPressed: () {
    if (validateAndSave()) {}
    OffreApi.savePffre(titreController.toString(), descController.toString(),
                  int.parse(prixdepartController.toString()), int.parse(prixdirecteController.toString()));

                  },
                  child: Text("submit")),
                  */
        ]),
      ),],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
    if (validateAndSave()) {
      /*
      OffreApi.savePffre(titreController.toString(), descController.toString(),
          int.parse(prixdepartController.toString()),
          int.parse(prixdirecteController.toString()));
*/

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadImage(),
          ));
    }
        },
      ),
    );
  }
  bool validateAndSave() {
    final form = _globalFormKey.currentState!;
    if (form.validate()) {
     // form.save();
      return true;
    }
    return false;
  }
}
