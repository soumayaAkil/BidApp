import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

import '../../config.dart';
import '../../models/bid.api.dart';
import '../../models/bid.dart';

class CalendrierBid extends StatefulWidget {
  @override
  _CalendrierBidAState createState() => _CalendrierBidAState();
}

class _CalendrierBidAState extends State<CalendrierBid> {
  late DateTime selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late List<CleanCalendarEvent> selectedEvent;

  late List<dynamic> _List_Event;
  late Map<DateTime, List<CleanCalendarEvent>> eventss = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent("Aoujourd'hui",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 00, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 00, 0),
          description: '',
          color: Colors.white),
    ],
  };
  @override
  void initState() {
    super.initState();
    // selectedEvent = eventss[selectedDay] ?? [];
    getRecipes();
  }

  Future<void> getRecipes() async {
    _List_Event = await BidApi.getAllBidC();
    print("ddddddddddddddd");
    print(_List_Event);
    /*  for (var i = 0; i < _List_Event.length; i++) {
      lDate.add(_List_Event[i]["date"]);


      for (var j = 0; j < _List_Event[i]["tab"].length; j++) {
        lBid.add(_List_Event[i]["tab"][j]);

      }


    } */
    setState(() {
      getEvents();
    });
  }

  void getEvents() async {
    eventss = {
      /*   DateTime.parse(ch) :
    [
      CleanCalendarEvent('Event A',
          startTime: DateTime.parse(ch2),
          endTime: DateTime.parse(ch3),

          description: 'A special event',
          color: Colors.orange),
    ],
*/

      // for(var i in lDate)
      for (var i = 0; i < _List_Event.length; i++)
        //  DateTime.parse(i):
        DateTime.parse(_List_Event[i]["date"]): [
          for (var j = 0; j < _List_Event[i]["tab"].length; j++)
            //for(var j in lBid)

            CleanCalendarEvent(
                "frais d'inscriptions :${_List_Event[i]["tab"][j]["frais_inscrit"]}",
                startTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    int.parse(
                        _List_Event[i]["tab"][j]["heure"].substring(0, 2)),
                    int.parse(
                        _List_Event[i]["tab"][j]["heure"].substring(3, 5))),
                endTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    int.parse(
                            _List_Event[i]["tab"][j]["heure"].substring(0, 2)) +
                        TIME_AUCTION,
                    int.parse(
                        _List_Event[i]["tab"][j]["heure"].substring(3, 5))),
                color: Colors.pink)
        ]
    };
  }

  /*
    for(var j=1;j<4;j++)
  DateTime.parse(ch)  :
    [
for(var m=4;m<7;m++)
  CleanCalendarEvent("${m}",
      startTime: DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month,
          DateTime
              .now()
              .day + 2, 14, 30),
      endTime: DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month,
          DateTime
              .now()
              .day + 2, 17, 0),
      color: Colors.pink)

    ],
  };
*/
  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = eventss[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.local_offer_rounded),
          SizedBox(
            width: 10,
          ),
          Text('calendrier')
        ]),
      ),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.purple,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('selected Day ${range.from},${range.to}');
          },
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: eventss,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
            fontSize: 15,
            color: Colors.purple,
          ),
          bottomBarTextStyle: TextStyle(
            color: Colors.black,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      ),
      //    bottomNavigationBar: 0==0 ? BottomNavigationBar(items: [],): BottomNavigationBar()
    );
  }
}
