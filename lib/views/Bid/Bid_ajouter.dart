import 'package:flutter/material.dart';

import '../../models/bid.api.dart';
import '../Admin/list_offre_non_vendu.dart';

class BidAjouter extends StatefulWidget {
  final int id_offre;

  const BidAjouter({required this.id_offre});
  @override
  _FormAddBidState createState() => _FormAddBidState();
}

class _FormAddBidState extends State<BidAjouter> {
  late bool _validate=false;
  TimeOfDay time =
      TimeOfDay(hour: DateTime.now().hour + 1, minute: DateTime.now().minute);
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    TextEditingController frais_inscrit = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.local_offer_rounded),
          SizedBox(
            width: 10,
          ),
          Text('Ajouter Bid'),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(100.0),
                bottomRight: const Radius.circular(100.0),
              ),
              child:
                  Image.asset('images/mar.jpg', height: 250, fit: BoxFit.cover),
            ),

            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(children: [
                Text(
                  "${date.year}/${date.month}/${date.day}",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                IconButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(date.year,date.month,date.day
                      ),
                      lastDate: DateTime(date.year+1,date.month+5),
                    );
                    if (newDate == null) return;
                    setState(() => date = newDate);
                  },
                  icon: Icon(
                    Icons.date_range_outlined,
                    color: Colors.purple,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 20),
            Row(children: [
              SizedBox(width: 50),
              Text(
                "${time.hour}:${time.minute}",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              IconButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,


                  );
                  if (newTime == null) return;
                  setState(() => time = newTime);
                },
                icon: Icon(
                  Icons.timer,
                  color: Colors.purple,
                ),
              ),

            ]),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Frais d'inscription en DT",
                  // errorText: _validate ?'champs invalide':null,
                ),
                controller: frais_inscrit,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 200,

              child: ElevatedButton(
                  key: const Key('souma'),
                  onPressed: () {

    print("preeeeeeeeeeeesed");
    if(frais_inscrit.text==""||int.parse(frais_inscrit.text)<1){
    setState(() =>_validate=true);

    print("falsssssse");
    }



    if(_validate==false)
    {
      /*BidApi.saveBid(
        "${time.hour}:${time.minute}",
        "${date.year}-${date.month}-${date.day}",
        int.parse(frais_inscrit.text),
        widget.id_offre);
      */


    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => ListOffreA()));
    }
    },
                  child: Text(
                    "submit",
                    style: TextStyle(fontSize: 25),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
