import 'package:flutter/material.dart';
import 'note_modal.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        Divider(thickness: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Text(
                        'Название предмета   ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'лекция',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                ),
                Text(''),
                Text('10:15-11:50'),
                Text(''),
                Text('Корпус №17, ауд. 1-17')
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                  onPressed: () {
                    showGeneralDialog(
                        context: buildContext,
                        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                          return const NoteModal();
                        }
                    );
                  },
                  icon: const Icon(Icons.edit, size: 15, color: Colors.grey),
                  splashRadius: 20,
                ),
                )

              ],
            )
          ],
        ),
      ],
    );
  }
}
