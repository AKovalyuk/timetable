import 'dart:convert';

import 'package:android1/lesson.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'timetable.dart';
import 'profile.dart';
import 'structures.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TabsApp(currentWeek: 0,));
}

class TabsApp extends StatefulWidget {

  int currentWeek;

  TabsApp({super.key, required this.currentWeek});

  @override
  State<TabsApp> createState() => _TabsAppState(this.currentWeek);
}

class _TabsAppState extends State<TabsApp> {

  int currentWeek;
  _TabsAppState(this.currentWeek) {}

  List<Week> weeks = [];

  jsonSet(Map<String, dynamic> data) {
    List<List<List<LessonStruct>>> weeks_data = [
      [[], [], [], [], [], []],
      [[], [], [], [], [], []]
    ];
    int id = 0;
    for (final lesson in data['timetable']) {
      int day_index = int.parse(lesson['day']) - 1;
      int week_index = int.parse(lesson['week']) - 1;
      weeks_data[week_index][day_index].add(LessonStruct(
          subject: lesson['subject'],
          type: lesson['type'],
          time: lesson['time'],
          location: lesson['place'],
          teacher: lesson['teacher'],
          lessonId: id
        )
      );
      id += 1;
    }
    for (final week in weeks_data) {
      for (final day in week) {
        day.sort((a, b) => a.time.compareTo(b.time));
      }
    }
    this.weeks = [];
    int wi = 0;
    for (final week in weeks_data) {
      List<DayStruct> week_days = [];
      for (int i = 0; i < 6; i++) {
        week_days.add(DayStruct(dayIndex: i, table: week[i], weekIndex: wi));
      }
      weeks.add(Week(days: week_days, weekIndex: wi));
      wi += 1;
    }
  }

  int _currentIndex = 0;
  String? currentGroup = ";";

  getTimetable(String? group) {
    return http.get(Uri.parse('https://edu.sfu-kras.ru/api/timetable/get&target=$group'));
  }

  _gotoTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  changeWeek() {
    setState(() {
      currentWeek = currentWeek == 1 ? 0 : 1;
    });
  }

  Future<SharedPreferences> _future = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    print('$currentWeek');
    var textStyle = const TextStyle(
      color: Color(0xFF777777)
    );
    return MaterialApp(
      title: 'SibFU Timetable',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFFFFFF),
        ),
        textTheme: TextTheme(
          bodySmall: textStyle,
          bodyMedium: textStyle
        ),

      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          toolbarOpacity: 1,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Расписание',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Моя группа'
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _gotoTab,
        ),
        body: this._currentIndex == 1 ?
        Profile(callback: this.setState) :
        FutureBuilder<SharedPreferences>(
            future: _future,
            builder: (BuildContext buildContext, AsyncSnapshot<SharedPreferences> snapshot) {
              if (!snapshot.hasData || snapshot.data?.getString('group') == null) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Расписание не загружено"),
                        Text("Нет интернета или не выбрана группа")
                      ],
                    )
                );//Timetable(week: Week(days: <DayStruct>[]));
              }
              else {
                if (snapshot.data?.getString('group') == this.currentGroup) {
                  return new Timetable(week: weeks[currentWeek], callback: changeWeek,);
                }
                else {
                  return FutureBuilder<http.Response>(
                      future: getTimetable(snapshot.data?.getString('group')),
                      builder: (BuildContext buildContext, AsyncSnapshot<http.Response> responseSnapshot) {
                        if (responseSnapshot.hasData) {
                          this.currentGroup = snapshot.data?.getString('group');
                          jsonSet(jsonDecode(responseSnapshot.data!.body));
                          return new Timetable(week: weeks[currentWeek], callback: changeWeek,);
                        }
                        else {
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Расписание не загружено"),
                                  Text("Нет интернета или не выбрана группа")
                                ],
                              )
                          );//Timetable(week: Week(days: <DayStruct>[]));
                        }
                      });
                }
              }
            }
        ),
        //pages.elementAt(_currentIndex),
      ),
    );
  }
}
