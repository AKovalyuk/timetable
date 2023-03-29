import 'package:flutter/material.dart';
import 'map_modal.dart';
import 'timetable_day.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 69, width: 10,),
                    TimetableDay(),
                    TimetableDay(),
                    TimetableDay(),
                    TimetableDay(),
                  ],
                ),
              )
          ),
          Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.search, color: Colors.grey)
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                                  return MapModal();
                                });
                          },
                          child: Icon(Icons.location_pin, color: Colors.grey)
                      ),
                      FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add, color: Colors.grey)
                      ),
                      FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.format_align_center, color: Colors.grey)
                      )
                    ]
                ),
              )
          )
        ]

    );
  }
}
