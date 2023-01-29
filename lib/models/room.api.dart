import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import 'offre.dart';

class RoomApi {



  static Future<dynamic> saveVal( int a, int b,String c,String d,int e,DateTime f,String j) async{
    var url=ROOM_URL+'/postRoom';
    var data=   {


      "id_room":a,
      "current_value":b,
      "nom":c.toString(),
      "prenom":d.toString(),
      "id_bid":e,
      "time_add":f.toString(),
      "topic":j.toString(),
    } ;
    var response = await http.post(url,body: json.encode(data),headers: {
      'Content-Type': 'application/json',
    },);
    var message= jsonDecode(response.body);
    print(message);
    print('bnj');
  }

}