import 'package:flutter/material.dart';
import 'lesson.dart';
import 'structures.dart';

class TimetableDay extends StatefulWidget {
  DayStruct day;

  TimetableDay({
    super.key,
    required this.day
  });

  @override
  State<TimetableDay> createState() => _TimetableDayState(day);
}

class _TimetableDayState extends State<TimetableDay> {
  DayStruct day;

  _TimetableDayState(this.day);

  @override
  Widget build(BuildContext buildContext) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.day.title),
              ] + List.from(this.day.table.map((lesson) => Lesson(lessonStruct: lesson))),
            ),
          )
      ),
    );
  }
}
