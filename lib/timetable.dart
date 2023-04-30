import 'package:flutter/material.dart';
import 'map_modal.dart';
import 'timetable_day.dart';
import 'structures.dart';

class Timetable extends StatefulWidget {

  final Week week;
  final Function() callback;

  Timetable({
    required this.week,
    required this.callback
  }) : super(key: ValueKey([week, callback])){
    print('timetable constructed');
  }

  @override
  State<Timetable> createState() {
    return _TimetableState(this.week, this.callback);
  }
}

class _TimetableState extends State<Timetable> {
  Week week;
  Function callback;

  _TimetableState(this.week, this.callback);

  getDays() {
    var temp = List<TimetableDay>.from(week.days.map((day) => TimetableDay(day: day)));
    return List<Widget>.from(temp.where((element) => element.day.table.isNotEmpty));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 69, width: 10,),
                    Text(this.week.weekIndex == 0 ? "Нечетная" : "Четная")
                  ] + getDays(),
                ),
              )
          ),
          Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.search, color: Colors.grey)
                      ),*/
                      FloatingActionButton(
                          onPressed: () {
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                                  return MapModal();
                                });
                          },
                          child: const Icon(Icons.location_pin, color: Colors.grey)
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            callback();
                          },
                          child: const Icon(Icons.arrow_forward, color: Colors.grey)
                      ),
                    ]
                ),
              )
          )
        ]

    );
  }
}
