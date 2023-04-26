class LessonStruct {
  String subject, type, time, location, teacher;
  int lessonId;
  LessonStruct({
    required this.subject,
    required this.type,
    required this.time,
    required this.location,
    required this.teacher,
    required this.lessonId
  });
}

class DayStruct {
  String title;
  List<LessonStruct> table;

  DayStruct({
    required this.title,
    required this.table
  });
}

class Week {
  List<DayStruct> days;

  Week({
    required this.days
  });
}
