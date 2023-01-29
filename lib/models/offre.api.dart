import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import 'offre.dart';

class OffreApi {
  static Future<List<Offre>> getRecipe() async {
   // var uri = Uri.http("http://localhost:6000/offre/GetAllOffres/");

    final response = await http.get(OFFRE_URL+"/GetAllOffres" );

    var data = jsonDecode(response.body);


    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return Offre.recipesFromSnapshot(_temp);
  }
  static Future<List<Offre>> getListAA() async {
    // var uri = Uri.http("http://localhost:6000/offre/GetAllOffres/");

    final response = await http.get(OFFRE_URL+"/GetOffresaccept" );

    var data = jsonDecode(response.body);


    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return Offre.recipesFromSnapshot(_temp);
  }
  static Future<List<Offre>> getListAC() async {
    // var uri = Uri.http("http://localhost:6000/offre/GetAllOffres/");

    final response = await http.get(OFFRE_URL+"/&" );

    var data = jsonDecode(response.body);


    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return Offre.recipesFromSnapshot(_temp);
  }
  static Future<dynamic> savePffre( String a, String b,int c,int d) async{


    var url=OFFRE_URL+'/PostOffre';
    var data=   {
      "titre":a.toString(),
      "description":b.toString(),
      "prix_depart":c,
      "prix_direct":d,
    } ;
    var response = await http.post(url,body: json.encode(data),headers: {
      'Content-Type': 'application/json',
    },);
    var message= jsonDecode(response.body);
    print(message);
    print('bnj');
  }
  static Future<dynamic>PutSatus(int id_offre,String status ,String desc_refuser)
  async {
    var url=OFFRE_URL+'/PutOffre';
    var data=   {
      "id_offre":id_offre,
      "status":status.toString(),
      "desc_refuser":desc_refuser.toString(),

    } ;
    var response = await http.post(url,body: json.encode(data),headers: {
      'Content-Type': 'application/json',
    },);
    var message= jsonDecode(response.body);
    print(message);
    print('bnj');
  }
}