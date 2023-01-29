import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import 'bid.dart';

class BidApi {
  static Future<List<Bid>> getAllBid() async {
    // var uri = Uri.http("http://localhost:6000/offre/GetAllOffres/");

    final response = await http.get(BID_URL + "/GetAllBids");

    var data = jsonDecode(response.body);

    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return Bid.recipesFromSnapshot(_temp);
  }

  static Future<List<dynamic>> getAllBidC() async {
    // var uri = Uri.http("http://localhost:6000/offre/GetAllOffres/");

    final response = await http.get(BID_URL + "/GetAllBidsByDate");

    var data = jsonDecode(response.body);

    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return _temp;
  }

  static Future<dynamic> saveBid(String a, String b, int c, int d) async {
    print("******************************");
    print("******************************");
    print("******************************");
    var url = BID_URL + '/PostBid';
    var data = {
      "date": b.toString(),
      "heure": a.toString(),
      "frais_inscrit": c,
      "id_offre": d,
    };
    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var message = jsonDecode(response.body);
    print(message);
    print('bnj');
  }
  static Future<dynamic> saveUser(int a, int b,String c) async {
    var url = BID_URL + '/PostuserBid';
    var data = {
      "id_bid": a,
      "id_client": b,
      "numero":c.toString(),

    };
    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var message = jsonDecode(response.body);
  }
  static Future<dynamic> verifierCode(int a, int b, String c) async {
    var url = BID_URL + '/Postcode';
    var data = {
      "id_bid": a,
      "id_client": b,
      "code_confirmation": c.toString(),

    };
    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var message = jsonDecode(response.body);
  }
}
