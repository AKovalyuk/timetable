import 'package:flutter/material.dart';
import 'map_modal.dart';
import 'timetable_day.dart';
import 'structures.dart';

class Timetable extends StatefulWidget {

  final Week week;
  final Function callback;

  const Timetable({
    super.key,
    required this.week,
    required this.callback
  });

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
                  children: const <Widget>[
                    SizedBox(height: 69, width: 10,)
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
                                  return const MapModal();
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
                      /*FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.add, color: Colors.grey)
                      ),
                      FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.format_align_center, color: Colors.grey)
                      )*/
                    ]
                ),
              )
          )
        ]

    );
  }
}
