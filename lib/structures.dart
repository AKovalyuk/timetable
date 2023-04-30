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
  static List<String> daysNames = [
    "Понедельник",
    "Вторник",
    "Среда",
    "Четверг",
    "Пятница",
    "Суббота"
  ];
  int dayIndex, weekIndex;
  List<LessonStruct> table;

  DayStruct({
    required this.dayIndex,
    required this.weekIndex,
    required this.table
  });
}

class Week {
  List<DayStruct> days;
  int weekIndex;

  Week({
    required this.weekIndex,
    required this.days
  });
}
