import 'package:bid_app/models/room.api.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../../config.dart';

class bidPage extends StatefulWidget {
  const bidPage({Key? key}) : super(key: key);


  @override
  State<bidPage> createState() => _bidPageState();
}

class _bidPageState extends State<bidPage> {

  TextEditingController prix = TextEditingController();
late String actuel="0";
  @override
  void dispose() async {
    super.dispose();
  }
  @override
  void initState() {
    published();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Reunion d'enchères ",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.gavel,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    // Start timer.


            /*   radioButton("Man", Colors.black, 0,) ,
                  radioButton("Woman", Colors.pink, 1),
                */
                  ],
                ),  Container(
                  margin: EdgeInsets.only(
                    left: 340,
                  ),
                  padding: EdgeInsets.all(4),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30,),
                    color: Colors.purple,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.timer_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(height: 2,),
                      Text(
                        "20 s",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(left: 110),
                  child: Text(
                    "Prix depart :1500 Dt ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 110,
                  ),
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'images/mar.jpg',
                      //height: 100,
                      //width: 100,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  margin: EdgeInsets.only(left: 50, top: 10, right: 50),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Prix actuel : ${actuel} Dt \n  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                      )),
                ),

                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  controller: prix,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Saisir votre proposition: ",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          print(int.parse(prix.value.text));
                          RoomApi.saveVal(2,int.parse(prix.value.text),"soumaya","akil",2,DateTime.now(),"");
                          print(prix.value);
                          print(DateTime.now());


                          print(prix.value);
                        });
                      },
                      child: Text(
                        "Proposer ",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void published() {

    connect();
  }

  Future<MqttServerClient> connect() async {

    MqttServerClient client =
    MqttServerClient.withPort(BASE_URL_MQTT, 'flutter_client', 1234);
    client.logging(on: true);
    client.onConnected = onConnected;


    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    print('EXAMPLE::Subscribing to the bidTv topic');
    const topic = 'BidTv'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      setState(() {
        actuel = pt;
      });
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
/*
    final builder = MqttClientPayloadBuilder();
    builder.addString(msg);
    /// Publish it
    print('EXAMPLE::Publishing our topic');
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
*/
    return client;
  }
}

// connection succeeded
void onConnected() {
  print('Connnnnnnnnnnnnected');
}
/*
void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}
*/