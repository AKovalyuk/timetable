import 'package:flutter/material.dart';
import 'note_modal.dart';
import 'structures.dart';

class Lesson extends StatefulWidget {
  Lesson({
    super.key,
    required this.lessonStruct
  });

  LessonStruct lessonStruct;

  @override
  State<Lesson> createState() => _LessonState(
      lessonStruct
  );
}

class _LessonState extends State<Lesson> {

  LessonStruct lessonStruct;

  _LessonState(this.lessonStruct);

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        Divider(thickness: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${this.lessonStruct.subject}   ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      this.lessonStruct.type,
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(this.lessonStruct.time),
                    Text(this.lessonStruct.teacher),
                    Text(this.lessonStruct.location)
                  ]
              ),
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
                          return NoteModal(id: this.lessonStruct.lessonId, lessonName: this.lessonStruct.subject);
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
