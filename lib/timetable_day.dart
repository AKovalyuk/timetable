import 'package:flutter/material.dart';
import 'lesson.dart';

class TimetableDay extends StatefulWidget {
  const TimetableDay({super.key});

  @override
  State<TimetableDay> createState() => _TimetableDayState();
}

class _TimetableDayState extends State<TimetableDay> {
  @override
  Widget build(BuildContext buildContext) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Вторник, 33 февраля'),
                Lesson(),
                Lesson(),
                Lesson()
              ],
            ),
          )
      ),
    );
  }
}
