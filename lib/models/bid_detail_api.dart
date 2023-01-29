import 'dart:convert';


import 'package:http/http.dart' as http;

import '../config.dart';
import 'bid_detail.dart';


class BidDetailApi {

  static Future<List<BidDetail>> getListBid(int a) async {
    var url=BID_URL+'/getAllBidDetail';
    var offre=   {
      "id_offre":a,
    } ;
    var response = await http.post(url,body: json.encode(offre),headers: {
      'Content-Type': 'application/json',
    },);


    var data = jsonDecode(response.body);


    print(data);
    List _temp = [];

    for (var i in data) {
      print("******************************");
      print(i);
      _temp.add(i);
    }

    return BidDetail.recipesFromSnapshot(_temp);
  }

}