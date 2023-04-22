import 'package:flutter/material.dart';
import 'timetable.dart';
import 'profile.dart';

void main() {
  runApp(TabsApp());
}

class TabsApp extends StatefulWidget {
  TabsApp({super.key});

  @override
  State<TabsApp> createState() => _TabsAppState();
}

class _TabsAppState extends State<TabsApp> {

  int _currentIndex = 0;
  static List<Widget> _pages = <Widget>[
    Timetable(),
    Profile()
  ];

  _gotoTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

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
        body: _pages.elementAt(_currentIndex),
      ),
    );
  }
}
